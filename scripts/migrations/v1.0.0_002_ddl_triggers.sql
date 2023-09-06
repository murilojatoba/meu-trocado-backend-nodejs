-- function atualização de saldos
CREATE OR REPLACE FUNCTION public.fn_atualiza_saldo(p_id_conta numeric, p_dt_referencia date)
RETURNS VOID AS $BODY$
DECLARE
	v_dt_referencia_anterior date := (p_dt_referencia - interval '1 month');
	v_dt_referencia_posterior date := (p_dt_referencia + interval '1 month');
	v_dt_ultimo_mes_ano_referencia date := (date_trunc('year',p_dt_referencia) + interval '11 month');
	v_saldo_anterior numeric(15,2);
	v_saldo numeric(15,2);
BEGIN
	RAISE INFO 'Atualizando saldo da conta % em %', p_id_conta, p_dt_referencia;

  -- ver se tem lancamentos no mês;
	-- IF (select 1 from tb_lancamento l where id_conta = p_id_conta and dt_referencia = p_dt_referencia limit 1) is NULL THEN
  --   RAISE INFO 'Sem lançamento em %.', p_dt_referencia;
  --   RETURN;
  -- END IF;

	select nr_saldo into v_saldo_anterior
	from tb_saldo s
	where id_conta = p_id_conta
	and dt_referencia = v_dt_referencia_anterior;

	IF NOT FOUND THEN
    RAISE INFO 'Sem registro de saldo em %.', v_dt_referencia_anterior;
    v_saldo_anterior := 0;
  ELSE
    RAISE INFO 'Saldo mês anterior %.', v_saldo_anterior;
	END IF;

  select v_saldo_anterior + coalesce(sum(
      case 
        when cd_tipo = 'E' then nr_valor
        when cd_tipo = 'S' then nr_valor * -1
      end
    ),0) into v_saldo
  from tb_lancamento l 
  where id_conta = p_id_conta
  and dt_referencia = p_dt_referencia;
	RAISE INFO 'Novo saldo calculado %', v_saldo;

  -- atualiza o saldo do mês
	update tb_saldo 
  set nr_saldo = v_saldo, 
      nr_saldo_anterior = v_saldo_anterior
  where id_conta = p_id_conta
  and dt_referencia = p_dt_referencia;

  IF NOT FOUND THEN
    insert into tb_saldo (id_conta, dt_referencia, nr_saldo_anterior, nr_saldo)
    values (p_id_conta, p_dt_referencia, v_saldo_anterior, v_saldo);
	  RAISE INFO 'Saldo inserido!';
  ELSE
	  RAISE INFO 'Saldo atualizado!';
  END IF;

  -- incluir chamada recursiva;
  IF p_dt_referencia < v_dt_ultimo_mes_ano_referencia THEN
    PERFORM fn_atualiza_saldo(p_id_conta, v_dt_referencia_posterior);
  END IF;

END;
$BODY$ LANGUAGE plpgsql;



-- function pós insert
CREATE OR REPLACE FUNCTION public.fn_tb_lancamento_insert()
RETURNS TRIGGER AS $BODY$
BEGIN
  PERFORM fn_atualiza_saldo(NEW.id_conta, NEW.dt_referencia);
  RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

-- trigger insert
create trigger tg_tb_lancamento_insert
after insert on tb_lancamento 
for each row 
EXECUTE PROCEDURE fn_tb_lancamento_insert();


-- function pós delete
CREATE OR REPLACE FUNCTION public.fn_tb_lancamento_delete()
RETURNS TRIGGER AS $BODY$
BEGIN
  PERFORM fn_atualiza_saldo(OLD.id_conta, OLD.dt_referencia);
  RETURN OLD;
END;
$BODY$ LANGUAGE plpgsql;

-- trigger delete
create trigger tg_tb_lancamento_delete
after delete on tb_lancamento 
for each row 
EXECUTE PROCEDURE fn_tb_lancamento_delete();