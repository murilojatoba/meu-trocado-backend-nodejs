select *
from tb_usuario

select *
from tb_conta c
;


insert into tb_conta (ds_nome, in_principal, id_usuario, id_usuario_ult_alteracao)
values ('Banco do Brasil', true, 2, 2)
;

select * 
from tb_categoria c 
order by 2, 5


select ('2023-08-01'::date - interval '1 month')::date



select fn_atualiza_saldo(1, :dtRef);


select * 
from tb_saldo 
where id_conta = :idConta
;


insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('E', 1, '2023-08-01', (select id_categoria from tb_categoria where ds_nome = 'Salário' and in_ativo = true), 10000, 'Salário', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-08-01', (select id_categoria from tb_categoria where ds_nome = 'Condomínio' and in_ativo = true), 6500, 'Cond.', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-08-01', (select id_categoria from tb_categoria where ds_nome = 'Gás' and in_ativo = true), 120, 'Gás', 2);


drop table tb_lancamento;

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


select coalesce(sum(
	case 
		when cd_tipo = 'E' then nr_valor
		when cd_tipo = 'S' then nr_valor * -1
	end
),0) as saldo
from tb_lancamento l 
where id_conta = :idConta
and dt_referencia = :dtRef
--and cd_tipo = 'E'
and in_ativo = true
;


select public.fn_atualiza_saldo(:idConta, :dtRef);


create trigger tg_tb_lancamento_insert
after insert on tb_lancamento 
for each row 
EXECUTE PROCEDURE fn_atualiza_saldo();





