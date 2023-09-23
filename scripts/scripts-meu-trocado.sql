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

-- Agosto
insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('E', 1, '2023-08-01', (select id_categoria from tb_categoria where ds_nome = 'Salário'), 10000, 'Salário', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-08-01', (select id_categoria from tb_categoria where ds_nome = 'Condomínio'), 6500, 'Cond.', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-08-01', (select id_categoria from tb_categoria where ds_nome = 'Gás'), 120, 'Gás', 2);

-- Setembro
insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('E', 1, '2023-09-01', (select id_categoria from tb_categoria where ds_nome = 'Salário'), 10000, 'Salário', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', (select id_categoria from tb_categoria where ds_nome = 'Condomínio'), 6500, 'Cond.', 2);


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




