USE  CATALOGO

CREATE TABLE GENERO (
idGenero tinyint primary key identity(1,1),
nomeGenero varchar(20)
);
GO

CREATE TABLE FILME (
idFilme int primary key identity(1,1),
idGenero tinyint foreign key references GENERO(idGenero),
tituloFilme varchar(50) not null
)

ALTER TABLE GENERO 
ALTER COLUMN nomeGenero VARCHAR(20) NOT NULL


--possivel, porem perdemos as infos ja cadastradas.
ALTER TABLE GENERO 
DROP COLUMN nomeGenero

ALTER TABLE GENERO
ADD  nomeGenero VARCHAR(20) NOT NULL