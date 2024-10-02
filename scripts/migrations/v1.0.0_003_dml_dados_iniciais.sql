-- usuarios
insert into tb_usuario (id_usuario, ds_nome, ds_email)
values (1, 'admin', 'admin@meutrocado.com.br');
insert into tb_usuario (ds_nome, ds_email)
values ('Murilo Jatobá', 'murilojatoba@gmail.com');


-- categorias
insert into tb_categoria (ds_nome, id_usuario) values ('Investimentos', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Salário', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Doações', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Saques', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Taxas banco', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('IPVA', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Estacionamento', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Educação', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Esportes', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Alimentação', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Saúde', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Assinaturas', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Anuidade', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Combustível', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Supermercado', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Farmácia', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Beleza', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Saldo inicial', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Compras', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Viagens', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Transporte', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Transferências', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Lazer', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Veículo', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Aluguel', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Condomínio', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Gás', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Energia', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Seguro', 1);
insert into tb_categoria (ds_nome, id_usuario) values ('Uber/Taxi', 2);
insert into tb_categoria (ds_nome, id_usuario) values ('Mariana', 2);
insert into tb_categoria (ds_nome, id_usuario) values ('Claro/Cel.', 2);
insert into tb_categoria (ds_nome, id_usuario) values ('Tim/Vivo', 2);
insert into tb_categoria (ds_nome, id_usuario) values ('Oi/Claro', 2);
insert into tb_categoria (ds_nome, id_usuario) values ('IPVA', 2);


-- contas
insert into tb_conta (ds_nome, in_principal, id_usuario, id_usuario_ult_alteracao)
values ('Banco do Brasil', true, 2, 2);


-- valores para teste
-- mês1 - setembro
insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('E', 1, '2023-09-01', '2023-09-01', (select id_categoria from tb_categoria where ds_nome = 'Saldo inicial'), 8940.52, 'Saldo inicial', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('E', 1, '2023-09-01', '2023-09-01', (select id_categoria from tb_categoria where ds_nome = 'Salário'), 14144.12, 'Salário', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-05', (select id_categoria from tb_categoria where ds_nome = 'Doações'), 500, 'Escola Iane', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-10', (select id_categoria from tb_categoria where ds_nome = 'Saques'), 150, 'Mesada', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-15', (select id_categoria from tb_categoria where ds_nome = 'Saques'), 150, 'Saque', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-01', (select id_categoria from tb_categoria where ds_nome = 'Taxas banco'), 14.6, 'Pac. serv. BB', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-05', (select id_categoria from tb_categoria where ds_nome = 'Saúde'), 318, 'Psicóloca ricardo', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-15', (select id_categoria from tb_categoria where ds_nome = 'Saúde'), 318, 'Psicóloca ricardo', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-25', (select id_categoria from tb_categoria where ds_nome = 'Saúde'), 500, 'Vacina', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-11', (select id_categoria from tb_categoria where ds_nome = 'Alimentação'), 16, 'Quentinha', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-13', (select id_categoria from tb_categoria where ds_nome = 'Alimentação'), 16, 'Quentinha', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-15', (select id_categoria from tb_categoria where ds_nome = 'Alimentação'), 16, 'Quentinha', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-16', (select id_categoria from tb_categoria where ds_nome = 'Alimentação'), 16, 'Quentinha', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-17', (select id_categoria from tb_categoria where ds_nome = 'Alimentação'), 20, 'Quentinha', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-18', (select id_categoria from tb_categoria where ds_nome = 'Alimentação'), 20, 'Quentinha', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-10', (select id_categoria from tb_categoria where ds_nome = 'Compras'), 10273.22, 'Cartão de Crédito', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-10', (select id_categoria from tb_categoria where ds_nome = 'Condomínio'), 1450.17, 'Condimínio', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-10', (select id_categoria from tb_categoria where ds_nome = 'Claro/Cel.'), 202.27, 'Claro', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-10', (select id_categoria from tb_categoria where ds_nome = 'Energia'), 124.26, 'Coelba', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-10', (select id_categoria from tb_categoria where ds_nome = 'Oi/Claro'), 222.18, 'Oi/Claro', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-09-01', '2023-09-01', (select id_categoria from tb_categoria where ds_nome = 'Investimentos'), 2000, 'Investimentos', 2);


-- mês2 - outubro
insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('E', 1, '2023-10-01', '2023-09-21', (select id_categoria from tb_categoria where ds_nome = 'Salário'), 14131.91, 'TRT', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-01', (select id_categoria from tb_categoria where ds_nome = 'Taxas banco'), 14.6, 'Pac. serv. BB', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-10', (select id_categoria from tb_categoria where ds_nome = 'Alimentação'), 600, 'Alimentação', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-20', (select id_categoria from tb_categoria where ds_nome = 'Alimentação'), 700, 'Alimentação', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-05', (select id_categoria from tb_categoria where ds_nome = 'Saúde'), 318, 'Psicóloca ricardo', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-15', (select id_categoria from tb_categoria where ds_nome = 'Saúde'), 318, 'Psicóloca ricardo', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-22', (select id_categoria from tb_categoria where ds_nome = 'Saúde'), 318, 'Psicóloca ricardo', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-01', (select id_categoria from tb_categoria where ds_nome = 'Investimentos'), 4000, 'Investimentos', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-01', (select id_categoria from tb_categoria where ds_nome = 'Doações'), 500, 'Escola Iane', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-10', (select id_categoria from tb_categoria where ds_nome = 'Compras'), 11628,57, 'Cartão de Crédito', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-10', (select id_categoria from tb_categoria where ds_nome = 'Condomínio'), 1455.17, 'Condimínio', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-10', (select id_categoria from tb_categoria where ds_nome = 'Claro/Cel.'), 212.7, 'Claro', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-10', (select id_categoria from tb_categoria where ds_nome = 'Energia'), 124.59, 'Coelba', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-10', (select id_categoria from tb_categoria where ds_nome = 'Oi/Claro'), 219.16, 'Oi/Claro', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-10-01', '2023-10-15', (select id_categoria from tb_categoria where ds_nome = 'Saques'), 1383.42, 'Saque', 2);


-- mês3 - novembro
insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('E', 1, '2023-11-01', '2023-10-21', (select id_categoria from tb_categoria where ds_nome = 'Salário'), 14176.68, 'TRT', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-05', (select id_categoria from tb_categoria where ds_nome = 'Saques'), 904.12, 'Saque', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-01', (select id_categoria from tb_categoria where ds_nome = 'Taxas banco'), 14.6, 'Pac. serv. BB', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-01', (select id_categoria from tb_categoria where ds_nome = 'Doações'), 500, 'Escola Iane', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-05', (select id_categoria from tb_categoria where ds_nome = 'Saúde'), 318, 'Psicóloca ricardo', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-10', (select id_categoria from tb_categoria where ds_nome = 'Compras'), 10700.89, 'Cartão de Crédito', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-10', (select id_categoria from tb_categoria where ds_nome = 'Condomínio'), 1457.76, 'Condimínio', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-10', (select id_categoria from tb_categoria where ds_nome = 'Aluguel'), 286.62, 'Claro', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-10', (select id_categoria from tb_categoria where ds_nome = 'Gás'), 41.31, 'Bahia Gás', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-10', (select id_categoria from tb_categoria where ds_nome = 'Claro/Cel.'), 175.86, 'Claro', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-10', (select id_categoria from tb_categoria where ds_nome = 'Tim/Vivo'), 259.55, 'Tim', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-10', (select id_categoria from tb_categoria where ds_nome = 'Energia'), 166.58, 'Coelba', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-11-01', '2023-11-10', (select id_categoria from tb_categoria where ds_nome = 'Oi/Claro'), 218.02, 'Oi/Claro', 2);


-- mês4 - dezembro
insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('E', 1, '2023-12-01', '2023-11-21', (select id_categoria from tb_categoria where ds_nome = 'Salário'), 14176.68, 'TRT', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('E', 1, '2023-12-01', '2023-11-21', (select id_categoria from tb_categoria where ds_nome = 'Salário'), 10327.99, '13o salário', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-12-01', '2023-12-10', (select id_categoria from tb_categoria where ds_nome = 'Compras'), 11231.52, 'Cartão de Crédito', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-12-01', '2023-12-01', (select id_categoria from tb_categoria where ds_nome = 'Doações'), 500, 'Escola Iane', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-12-01', '2023-12-05', (select id_categoria from tb_categoria where ds_nome = 'Saques'), 990.73, 'Saque', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-12-01', '2023-12-01', (select id_categoria from tb_categoria where ds_nome = 'Taxas banco'), 14.55, 'Pac. serv. BB', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-12-01', '2023-12-05', (select id_categoria from tb_categoria where ds_nome = 'Saúde'), 318, 'Psicóloca ricardo', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-12-01', '2023-12-10', (select id_categoria from tb_categoria where ds_nome = 'Condomínio'), 1671.43, 'Condimínio', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-12-01', '2023-12-10', (select id_categoria from tb_categoria where ds_nome = 'Gás'), 157.09, 'Bahia Gás', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-12-01', '2023-12-10', (select id_categoria from tb_categoria where ds_nome = 'Tim/Vivo'), 344.79, 'Tim', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-12-01', '2023-12-10', (select id_categoria from tb_categoria where ds_nome = 'Energia'), 631.04, 'Coelba', 2);

insert into tb_lancamento (cd_tipo, id_conta, dt_referencia, dt_lancamento, id_categoria, nr_valor, ds_descricao, id_usuario_ult_alteracao)
values ('S', 1, '2023-12-01', '2023-12-10', (select id_categoria from tb_categoria where ds_nome = 'Oi/Claro'), 222.1, 'Oi/Claro', 2);