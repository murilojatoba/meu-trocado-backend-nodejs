--Obter dados das tabelas do banco 
select * 
from information_schema.tables 
where 1=1
and table_schema = 'public'
and table_name ilike '%receita%'
;

select *
from tb_usuario

select *
from tb_conta c
;


select * 
from tb_categoria c 
order by 2


select ('2023-08-01'::date - interval '1 month')::date



select fn_atualiza_saldo(:idConta, :dtRef)
;


select * 
from tb_saldo 
where id_conta = :idConta
order by dt_referencia 
;


select *
from tb_lancamento l 
where id_conta = :idConta
and dt_referencia = :dtRef
order by dt_referencia, dt_lancamento 
;


select c.id_categoria, c.ds_nome, sum(l.nr_valor) valor, 'L' tipo_valor
from tb_categoria c
left join tb_lancamento l using (id_categoria)
where l.dt_referencia = :dtRef
group by c.id_categoria

union all 

select c.id_categoria, c.ds_nome, avg(l.nr_valor) valor, 'M' tipo_valor
from tb_categoria c
left join tb_lancamento l using (id_categoria)
where dt_referencia between (:dtRef::date - interval '1 year')::date and :dtRef
group by c.id_categoria
;


drop table tb_lancamento;


select coalesce(sum(
	case 
		when cd_tipo = 'E' then nr_valor
		when cd_tipo = 'S' then nr_valor * -1
	end
),0) as saldo
from tb_lancamento l 
where id_conta = :idConta
and dt_referencia = :dtRef
;





select (date_trunc('year','2023-08-01'::date) + interval '11 month')


select * from usuarios




insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-10', (select id_categoria from tb_categoria where ds_nome = 'Compras'), 10273.22, 'Cartão de Crédito', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-15', (select id_categoria from tb_categoria where ds_nome = 'Saques'), 150, 'Saque', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-16', (select id_categoria from tb_categoria where ds_nome = 'Alimentação'), 16, 'Quentinha', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-17', (select id_categoria from tb_categoria where ds_nome = 'Alimentação'), 20, 'Quentinha', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-18', (select id_categoria from tb_categoria where ds_nome = 'Alimentação'), 20, 'Quentinha', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-25', (select id_categoria from tb_categoria where ds_nome = 'Saúde'), 500, 'Vacina', 2);




