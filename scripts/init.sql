create sequence IF NOT EXISTS sq_tb_usuario minvalue 2 increment by 1;

create table tb_usuario (
  id_usuario numeric not null default nextval('sq_tb_usuario'),
  ds_nome varchar(200) not null,
  ds_email varchar(200) not null,
  dt_criacao timestamp not null default now(),
  in_ativo boolean not null default true,
  constraint tb_usuario_pf primary key (id_usuario),
  constraint tb_usuario_uk unique key (email)
);

insert into tb_usuario (id_usuario, ds_nome, ds_email)
values (1, 'admin', 'admin@meutrocado.com.br');
insert into tb_usuario (ds_nome, ds_email)
values ('Murilo Jatobá', 'murilojatoba@gmail.com');


create sequence IF NOT EXISTS sq_tb_conta minvalue 1 increment by 1;

create table tb_conta (
  id_conta numeric not null default nextval('sq_tb_conta'),
  ds_nome varchar(200) not null,
  dt_criacao timestamp not null default now(),
  in_principal boolean not null default false,
  in_ativo boolean not null default true,
  id_usuario numeric not null,
  constraint tb_conta_pf primary key (id_conta),
  constraint tb_conta_fk foreign key (id_usuario) references tb_usuario(id_usuario)
);


create sequence IF NOT EXISTS sq_tb_categoria minvalue 1 increment by 1;

create table tb_categoria (
  id_categoria numeric not null default nextval('sq_tb_categoria'),
  ds_nome varchar(200) not null,
  dt_inclusao timestamp not null default now(),
  in_ativo boolean not null default true,
  id_usuario numeric not null,
  constraint tb_categoria_pf primary key (id_categoria),
  constraint tb_categoria_fk foreign key (id_usuario) references tb_usuario(id_usuario),
  constraint tb_categoria_uk unique key (ds_nome, id_usuario)
);

insert into tb_categoria (ds_nome, id_usuario) values ('', 1); -- parei aqui


create sequence IF NOT EXISTS sq_tb_lancamento minvalue 1 increment by 1;

create table tb_lancamento (
  id_lancamento numeric not null default nextval('sq_tb_lancamento'),
  cd_tipo varchar(1) not null,
  id_categoria numeric not null,
  ds_descricao varchar(200) not null,
  nr_valor numeric(15,2) not null,     -- 9.999.999.999.999,99
  dt_inclusao timestamp not null default now(),
  id_conta numeric not null,
  id_usuario numeric not null,
  constraint tb_lancamento_pf primary key (id_lancamento),
  constraint tb_lancamento_fk1 foreign key (id_usuario) references tb_usuario(id_usuario),
  constraint tb_lancamento_fk2 foreign key (id_conta) references tb_conta(id_conta),
  constraint tb_lancamento_fk3 foreign key (id_categoria) references tb_categoria(id_categoria)
);