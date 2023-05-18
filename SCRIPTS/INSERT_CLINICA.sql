USE Clinica

INSERT INTO clinica(razaoSocial,cnpj,endereco)
VALUES ('PORTO CLINICS','12345678945612','RUA DA PORTO')

INSERT INTO tipoPet(descricao)
VALUES ('Cachorro'),('Gato')

INSERT INTO raca(descricao, idTipoPet)
VALUES ('Poodle',1),('Labrador', 1),('Siames',2)

INSERT INTO Dono(nome)
values ('Paulo'),('Lucas')

INSERT INTO Pets(nome,dataNascimento,idRaca,idDono)
values('Thor','20201001',1,1),
      ('Sammy','20160114',1,2),
	  ('Snoopy','20000814',3,2)

	  select * from Pets 

INSERT INTO veterinario(nome,crmv,idClinica)
VALUES ('Leandro','123123',1),
       ('Gentil','1213',1)

INSERT INTO atendimento(descricao, dataAtendimento,idVeterinario,
idPet)
VALUES ('Restam 10 dias de vida','20210119',1,3),
       ('O paciente está ok','20201010',2,2),
	   ('O paciente está ok','20221001',2,4)