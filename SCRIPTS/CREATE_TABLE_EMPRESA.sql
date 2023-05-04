
USE EMPRESA

CREATE TABLE PESSOA(
idPessoa tinyint primary key identity(1,1),
nomePessoa varchar(50) NOT NULL,
CNH char(11) 
)

CREATE TABLE TELEFONE (
idTelefone tinyint primary key identity(1,1),
idPessoa tinyint foreign key REFERENCES PESSOA(idPessoa),
numeroTelefone varchar(15)
)

CREATE TABLE EMAIL (
idEmail tinyint primary key identity(1,1),
idPessoa tinyint foreign key REFERENCES PESSOA(idPessoa),
enderecoEmail varchar(50)
)
