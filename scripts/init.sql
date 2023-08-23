create sequence IF NOT EXISTS sq_tb_usuario minvalue 2 increment by 1;

create table tb_usuario (
  id_usuario numeric not null default nextval('sq_tb_usuario'),
  ds_nome varchar(200) not null,
  ds_email varchar(200) not null,
  dt_criacao timestamp not null default now(),
  in_ativo boolean not null default true,
  constraint tb_usuario_pk primary key (id_usuario),
  constraint tb_usuario_uk unique (ds_email)
);

insert into tb_usuario (id_usuario, ds_nome, ds_email)
values (1, 'admin', 'admin@meutrocado.com.br');
insert into tb_usuario (ds_nome, ds_email)
values ('Murilo Jatobá', 'murilojatoba@gmail.com');

create index if not exists idx_tb_usuario on tb_usuario using btree (ds_nome, in_ativo);
create index if not exists idx_tb_usuario2 on tb_usuario using btree (ds_email, in_ativo);


create sequence IF NOT EXISTS sq_tb_conta minvalue 1 increment by 1;

create table tb_conta (
  id_conta numeric not null default nextval('sq_tb_conta'),
  ds_nome varchar(200) not null,
  dt_criacao timestamp not null default now(),
  in_principal boolean not null default false,
  in_ativo boolean not null default true,
  id_usuario numeric not null,
  id_usuario_ult_alteracao numeric not null,
  dt_ult_alteracao timestamp not null default now(),
  constraint tb_conta_pk primary key (id_conta),
  constraint tb_conta_fk foreign key (id_usuario) references tb_usuario (id_usuario),
  constraint tb_conta_fk2 foreign key (id_usuario_ult_alteracao) references tb_usuario (id_usuario)
);

create index if not exists idx_tb_conta on tb_conta using btree (id_usuario, in_ativo, ds_nome);


create sequence IF NOT EXISTS sq_tb_categoria minvalue 1 increment by 1;

create table tb_categoria (
  id_categoria numeric not null default nextval('sq_tb_categoria'),
  ds_nome varchar(200) not null,
  dt_inclusao timestamp not null default now(),
  in_ativo boolean not null default true,
  id_usuario numeric not null,
  constraint tb_categoria_pk primary key (id_categoria),
  constraint tb_categoria_fk foreign key (id_usuario) references tb_usuario (id_usuario)
);

create index if not exists idx_tb_categoria on tb_categoria using btree (id_usuario, in_ativo, ds_nome);

insert into tb_categoria (ds_nome, id_usuario) values ('Investimento', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Salário', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Doação', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Saque', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Taxa banco', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('IPVA', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Estacionamento', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Educação', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Esporte', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Alimentação', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Saúde', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Assinatura', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Anuidade', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Combustível', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Mercado', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Farmácia', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Beleza', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Compras', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Viagem', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Uber/Taxi', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Lazer', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Desp. Carro', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Aluguel', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Condomínio', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Gás', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Energia', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Mariana', 2);
insert into tb_categoria (ds_nome, id_usuario) values ('Claro/Cel.', 2);
insert into tb_categoria (ds_nome, id_usuario) values ('Tim/Vivo', 2);
insert into tb_categoria (ds_nome, id_usuario) values ('Oi/Claro', 2);


create sequence IF NOT EXISTS sq_tb_lancamento minvalue 1 increment by 1;

create table tb_lancamento (
  id_lancamento numeric not null default nextval('sq_tb_lancamento'),
  cd_tipo varchar(1) not null,
  id_categoria numeric not null,
  dt_referencia date not null default to_char(now(),'yyyy-mm-01')::date,
  ds_descricao varchar(200) not null,
  nr_valor numeric(15,2) not null,     -- 9.999.999.999.999,99
  dt_inclusao timestamp not null default now(),
  id_conta numeric not null,
  in_ativo boolean not null default true,
  -- id_usuario numeric not null,
  dt_ult_alteracao timestamp not null default now(),
  id_usuario_ult_alteracao numeric not null,
  constraint tb_lancamento_pk primary key (id_lancamento),
  -- constraint tb_lancamento_fk1 foreign key (id_usuario) references tb_usuario(id_usuario),
  constraint tb_lancamento_fk foreign key (id_conta) references tb_conta (id_conta),
  constraint tb_lancamento_fk2 foreign key (id_categoria) references tb_categoria (id_categoria),
  constraint tb_lancamento_fk3 foreign key (id_usuario_ult_alteracao) references tb_usuario (id_usuario),
  constraint tb_lancamento_cc check (cd_tipo in ('E', 'S'))
);

create index if not exists idx_tb_lancamento on tb_lancamento using btree (id_conta, in_ativo, dt_referencia);


create sequence IF NOT EXISTS sq_tb_saldo minvalue 1 increment by 1;

create table tb_saldo (
  id_saldo numeric not null default nextval('sq_tb_saldo'),
  id_conta numeric not null,
  dt_referencia date not null,
  nr_saldo_anterior numeric(15,2) not null,
  nr_saldo numeric(15,2) not null,
  constraint tb_saldo_pk primary key (id_saldo),
  constraint tb_saldo_fk foreign key (id_conta) references tb_conta (id_conta)
);

create index if not exists idx_tb_saldo on tb_saldo using btree (id_conta, dt_referencia);


-- function atualização de saldos
CREATE OR REPLACE FUNCTION public.fn_atualiza_saldo()
RETURNS TRIGGER AS $BODY$
DECLARE
  v_id_conta integer := NEW.id_conta;
  v_dt_referencia date := NEW.dt_referencia;
	v_dt_referencia_anterior date := (v_dt_referencia - interval '1 month');
	v_dt_referencia_posterior date := (v_dt_referencia + interval '1 month');
	v_saldo_anterior numeric(15,2);
	v_saldo numeric(15,2);
BEGIN
	RAISE INFO 'Atualizando saldo da conta % no referência %', v_id_conta, v_dt_referencia;

	select nr_saldo into v_saldo_anterior
	from tb_saldo s
	where id_conta = v_id_conta
	and dt_referencia = v_dt_referencia_anterior;

	IF NOT FOUND THEN
    RAISE INFO 'Sem registro de saldo para a referência %.', v_dt_referencia_anterior;
    v_saldo_anterior := 0;
  ELSE
    RAISE INFO 'Obtido saldo anterior %.', v_saldo_anterior;
	END IF;

  select v_saldo_anterior + coalesce(sum(
    case 
      when cd_tipo = 'E' then nr_valor
      when cd_tipo = 'S' then nr_valor * -1
    end
  ),0) into v_saldo
  from tb_lancamento l 
  where id_conta = v_id_conta
  and dt_referencia = v_dt_referencia
  and in_ativo = true;

	RAISE INFO 'Novo saldo obtido %', v_saldo;

  -- atualiza o saldo do mês
	update tb_saldo 
  set nr_saldo = v_saldo
  where id_conta = v_id_conta
  and dt_referencia = v_dt_referencia;

  IF NOT FOUND THEN
    insert into tb_saldo (id_conta, dt_referencia, nr_saldo_anterior, nr_saldo)
    values (v_id_conta, v_dt_referencia, v_saldo_anterior, v_saldo);
	  RAISE INFO 'Saldo inserido!';
  ELSE
	  RAISE INFO 'Saldo atualizado!';
  END IF;

  RETURN NEW;
  -- incluir chamada recursiva;

END;
$BODY$ LANGUAGE plpgsql;


create trigger tg_tb_lancamento_insert
after insert on tb_lancamento 
for each row 
EXECUTE PROCEDURE fn_atualiza_saldo();