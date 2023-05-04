USE VEICULOS

CREATE TABLE EMPRESA (
idEmpresa int primary key identity(1,1),
nomeEmpresa varchar(50) not null
)

CREATE TABLE MARCA(
idMarca tinyint primary key identity(1,1),
nomeMarca varchar(15) not null
)

CREATE TABLE MODELO (
idModelo int primary key identity(1,1),
idMarca tinyint foreign key references MARCA(idMarca),
nomeModelo varchar(40) not null
)

CREATE TABLE VEICULO (
idVeiculo int primary key identity(1,1),
idModelo int foreign key references MODELO(idModelo),
idEmpresa int foreign key references EMPRESA(idEmpresa),
placa char(7) not null 
)
--MODIFICACAO NA TABELA JA CRIADA

--remover coluna por inteiro
ALTER TABLE VEICULO
DROP COLUMN PLACA

--adicionar coluna nao existente
ALTER TABLE VEICULO
ADD placa char(7) not null UNIQUE --valor unico

--remover restricao UNIQUE criada
ALTER TABLE VEICULO  
DROP CONSTRAINT UQ__VEICULO__0C057425F3395A12;  

--alterar valor de coluna ja criada
ALTER TABLE VEICULO
ALTER COLUMN placa char(7) not null 

--adicionar UNIQUE em coluna ja criada
ALTER TABLE VEICULO
ADD UNIQUE (placa);

CREATE TABLE CLIENTES (
idCliente int primary key identity(1,1),
nomeCliente varchar(50) not null,
cpfCliente char(15) not null UNIQUE
)



CREATE TABLE ALUGUEIS(
 idAluguel int primary key identity(1,1),
 idCliente int foreign key references CLIENTES(idCliente),
 idVeiculo int foreign key references VEICULO(idVeiculo),
 dataRetirada DATETIME,
 dataDevolucao DATETIME
)
