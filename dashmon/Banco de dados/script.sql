-- create database
create database itau;
-- colocando o db em uso
use itau;

-- criação dos campos na tabela
create table itau.clientes(
codigo_cliente integer not null primary key,
nome_cliente varchar(50) not null,
idade_cliente integer(3) not null,
email_cliente varchar(80) not null
);

-- verificando a estrutura da tabela
describe itau.clientes;

-- Inserindo dados na tabela
insert into itau.clientes (codigo_cliente,nome_cliente,idade_cliente,email_cliente)
values (2,"Reginato",28,"reginato@gmail.com"),
	   (3,"Vanessa Chiarelli",20,"vanessa@itau.com"),
       (4,"Thayara Carvalho",19,"thayara@itau.com");

--select na TABELA
select * from itau.clientes order by nome_cliente;
select nome_cliente,email_cliente from itau.clientes order by nome_cliente;
select * from itau.clientes where idade_cliente >=20 and idade_cliente <=25 order by idade_cliente;
select * from itau.clientes where idade_cliente between 20 and 50 order by idade_cliente;

select * from itau.clientes where (idade_cliente>80);
update itau.clientes set nome_cliente="Rodrigo de Paula", idade_cliente=30 where codigo_cliente=1;


-- menor valoir da tabela
select min(idade_cliente) from itau.clientes;
select min(idade_cliente) as Idade_Minima from itau.clientes;
select * from itau.clientes where idade_cliente=18;

-- subselect com idade minima
select * from itau.clientes where idade_cliente=(select min(idade_cliente) from itau.clientes);

-- subselect com idade maxima
select * from itau.clientes where idade_cliente=(select max(idade_cliente)  from itau.clientes);
select max(idade_cliente) as Maior_Idade from itau.clientes;

-- select com like começa com rodrigo
select * from itau.clientes where nome_cliente like "rodrigo%";
select * from itau.clientes where nome_cliente like "%paula";
select * from itau.clientes where nome_cliente like "F%";

-- clientes com D e E
select * from itau.clientes where nome_cliente like  "D%" or nome_cliente like "F%";

-- criando tbl de backup
create table itau.bck_clientes select * from itau.clientes;
select * from itau.bck_clientes;
describe itau.bck_clientes;

-- quantidade de registros na tabela
select count(*) as Total_Reg_Tab_Clientes from itau.clientes;
select count(*) as totalbkp from itau.bck_clientes;

-- inserindo campos na estrutura tabela
alter table itau.clientes add endereco varchar(80) not null;
select * from itau.clientes;

-- excluindo campos na estrutura tabela
alter table itau.clientes drop endereco;
select * from itau.clientes;

-- renomeando campos na estrutura tabela
alter table itau.clientes rename column endereco to endereco_cliente;
select * from itau.clientes;

-- inserindo registros em um campo predefinido via update 
update itau.clientes set endereco_cliente="Rua Tito" where codigo_cliente=1;
describe itau.clientes;

-- modificando o nome e o tipo de campo de uma tabela change
alter table itau.clientes change endereco_cliente endereco_cliente varchar(100) not null;
describe itau.clientes;


-- update em massa nos campos em branco ** pode usar um betwen do 3 ao final
update itau.clientes set endereco_cliente="Atualizar o endereco do cliente" where endereco_cliente="";
select * from itau.clientes;

-- drop table apaga a tabela fisicamente
drop table itau.bck_clientes;

-- apaga todo o BD (drop database itau;

-- apaga todos os registros da tabela, exceto a estrutura
delete from itau.clientes;
select * from itau.clientes where idade_cliente>60;

-- restaurando os resgistros na estrutura da tabela
describe itau.clientes;

insert into itau.clientes (codigo_cliente,nome_cliente,idade_cliente,email_cliente,endereco_cliente) 
select * from itau.bck_clientes;

-- restaurando range de registros

insert into itau.clientes (codigo_cliente,nome_cliente,idade_cliente,email_cliente,endereco_cliente)
select * from itau.bck_clientes where idade_cliente>60;

-- Deletando clientes acima de 60 anos
delete from itau.clientes where idade_cliente>60;
select * from itau.clientes where idade_cliente>60;
select count(*) from itau.clientes;

-- Parte 2) Criação do Database Uninanco

create database unibanco;
use unibanco;

create database itau;
use itau;

-- importando os clientes da tabela itau para unibanco - migração
create table unibanco.clientes select * from itau.clientes;
select * from unibanco.clientes;


--  criando tabela itau.clientes
create table itau.clientes (
codigo_cliente integer not null auto_increment,
nome_cliente varchar(50) not null,
cpf_cliente char(11) not null,
endereco_cliente varchar(60) not null,
bairro_cliente varchar(40) not null,
estado_cliente char(2) not null,
agencia_cliente char(4) not null,
conta_corrente_cliente varchar(8) not null,
digito_verificador_cliente integer(1) not null,
ddd_cliente integer(2) not null,
telefone_cliente bigint not null,
email_cliente varchar(80) not null,
data_de_controle_de_cadastro date,
primary key (codigo_cliente,cpf_cliente));

describe itau.clientes;

insert into itau.clientes (nome_cliente,cpf_cliente,endereco_cliente,bairro_cliente,estado_cliente,agencia_cliente,
conta_corrente_cliente,digito_verificador_cliente,ddd_cliente,telefone_cliente,email_cliente,data_de_controle_de_cadastro)
values ("Rodrigo de Paula",38427700814,"Rua Adolfo Reile 286","Saude","SP","0109","001000",1,11,987654888,"rodrigodepaula@gmail.com",now());

-- migracao da table 
insert into itau.clientes 
(nome_cliente,cpf_cliente,endereco_cliente,bairro_cliente,estado_cliente,agencia_cliente,conta_corrente_cliente,digito_verificador_cliente,ddd_cliente,telefone_cliente,email_cliente,data_de_controle_de_cadastro)
select nome_cliente,"Atualizar",endereco_cliente,"Atualizar","xx","0","0",0,0,0,email_cliente,now() from unibanco.clientes;

select * from itau.clientes;
select * from unibanco.clientes;


-- criação da tabela vendas

create table itau.vendas(
codigo_venda int not null auto_increment primary key,
nome_produto_venda varchar(50) not null,
quantidade_produto_vendido int not null,
valor_unitario_venda decimal(8,2) not null,
nome_vendedor varchar (50) not null);

describe itau.vendas;

insert into itau.vendas(nome_produto_venda,quantidade_produto_vendido,valor_unitario_venda,nome_vendedor)
values ("Mouse",20,35.50,"Marcos"),
	   ("Teclado",30,39.85,"Cristina"),
	   ("Monitor",15,450,"Cristina"),
       ("Impressora",10,280.00,"Marcos"),
	   ("Pendrive",80,15.50,"Edson"),
       ("Gabinete",5,320,"Marcos");
       
       select * from itau.vendas;
	
   -- calculo com select no banco BDF 
	SELECT 
    nome_produto_venda,
    quantidade_produto_vendido,
    valor_unitario_venda,
    (quantidade_produto_vendido*valor_unitario_venda) as Total_Venda,
    nome_vendedor
FROM
    itau.vendas;

-- criando somatoria total do bc
SELECT 
    SUM(quantidade_produto_vendido * valor_unitario_venda) AS Total_Venda
FROM
    itau.vendas;
    
-- total de vendas por vendedor    
SELECT 
    SUM(quantidade_produto_vendido * valor_unitario_venda) AS Total_Venda,
    nome_vendedor
FROM
    itau.vendas group by nome_vendedor;
    
    
    
    -- Criando tabelas de produto e marcas
    use itau;
    
    CREATE TABLE `Produtos` (
	`Cod_Produto` INT NOT NULL AUTO_INCREMENT,
	`Nome_Produto` varchar(50) NOT NULL,
	`Valor_Produto` DECIMAL(8,2) NOT NULL,
	`Cod_Marca` INT NOT NULL,
	PRIMARY KEY (`Cod_Produto`)
);

CREATE TABLE `Marcas` (
	`Cod_Marca` INT NOT NULL AUTO_INCREMENT,
	`Nome_Marca` varchar(50) NOT NULL,
	PRIMARY KEY (`Cod_Marca`)
);

ALTER TABLE `Produtos` ADD CONSTRAINT `Produtos_fk0` FOREIGN KEY (`Cod_Marca`) REFERENCES `Marcas`(`Cod_Marca`);

describe marcas;
insert into itau.produtos (Nome_Produto,Valor_Produto,Cod_Marca)
values ("Geladeira",2200.00,1),
("Fogão",1850,1),
("Liquidificador",89.90,2),
("Microondas",300.00,1),
("Batedeira",150.00,1),
("Celular",1500.00,1),
("TV",1800.00,3);

select * from produtos;

insert into itau.marcas(Nome_Marca)
values ("Brastemp"),
("Cadence"),
("Samsung"),
("LG");

-- verificando o relacionamento das tabelas no bd tudo o que é igual

select p.Nome_Produto,p.Valor_Produto,m.Nome_Marca
from itau.marcas as m
inner join itau.produtos as p
on (m.Cod_Marca = p.Cod_Marca);

select p.Nome_Produto,p.Valor_Produto,m.Nome_Marca
from itau.marcas as m
left join itau.produtos as p
on (m.Cod_Marca = p.Cod_Marca);

-- Criando uma procedure no Banco de Dados

create table itau.bck_clientes select * from itau.clientes;
create table itau.bck_produtos select * from itau.produtos;
create table itau.bck_marcas select * from itau.marcas;
create table itau.bck_vendas select * from itau.vendas;

use itau;

insert into itau.marca(Nome_Marca)
values ("ab"),
("cd"),
("ef"),
("gh");

use itau;
select * from bck.marcas;


		

    
    
