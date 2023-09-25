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

create index if not exists idx_tb_usuario on tb_usuario using btree (ds_nome, in_ativo);
create index if not exists idx_tb_usuario2 on tb_usuario using btree (ds_email, in_ativo);


create sequence IF NOT EXISTS sq_tb_conta minvalue 1 increment by 1;

create table tb_conta (
  id_conta numeric not null default nextval('sq_tb_conta'),
  ds_nome varchar(200) not null,
  dt_criacao timestamp not null default now(),
  in_principal boolean not null default false,
  id_usuario numeric not null,
  id_usuario_ult_alteracao numeric not null,
  dt_ult_alteracao timestamp not null default now(),
  constraint tb_conta_pk primary key (id_conta),
  constraint tb_conta_fk foreign key (id_usuario) references tb_usuario (id_usuario),
  constraint tb_conta_fk2 foreign key (id_usuario_ult_alteracao) references tb_usuario (id_usuario)
);

create index if not exists idx_tb_conta on tb_conta using btree (id_usuario, ds_nome);


create sequence IF NOT EXISTS sq_tb_categoria minvalue 1 increment by 1;

create table tb_categoria (
  id_categoria numeric not null default nextval('sq_tb_categoria'),
  ds_nome varchar(200) not null,
  dt_inclusao timestamp not null default now(),
  id_usuario numeric not null,
  constraint tb_categoria_pk primary key (id_categoria),
  constraint tb_categoria_fk foreign key (id_usuario) references tb_usuario (id_usuario)
);

create index if not exists idx_tb_categoria on tb_categoria using btree (id_usuario, ds_nome);


create sequence IF NOT EXISTS sq_tb_lancamento minvalue 1 increment by 1;

create table tb_lancamento (
  id_lancamento numeric not null default nextval('sq_tb_lancamento'),
  cd_tipo varchar(1) not null,
  id_categoria numeric not null,
  dt_referencia date not null default to_char(now(),'yyyy-mm-01')::date,
  ds_descricao varchar(200) not null,
  nr_valor numeric(15,2) not null,     -- 9.999.999.999.999,99
  dt_lancamento timestamp not null default now(),
  id_conta numeric not null,
  dt_ult_alteracao timestamp not null default now(),
  id_usuario_ult_alteracao numeric not null,
  constraint tb_lancamento_pk primary key (id_lancamento),
  constraint tb_lancamento_fk foreign key (id_conta) references tb_conta (id_conta),
  constraint tb_lancamento_fk2 foreign key (id_categoria) references tb_categoria (id_categoria),
  constraint tb_lancamento_fk3 foreign key (id_usuario_ult_alteracao) references tb_usuario (id_usuario),
  constraint tb_lancamento_cc check (cd_tipo in ('E', 'S'))
);

create index if not exists idx_tb_lancamento on tb_lancamento using btree (id_conta, dt_referencia);


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


