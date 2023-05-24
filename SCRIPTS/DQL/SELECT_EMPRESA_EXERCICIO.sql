 

 USE EMPRESA
-->Cadastrar 3 pessoas: 
INSERT INTO PESSOA (nomePessoa,CNH)
VALUES ('PESSOA1','13212313'),
('PESSOA2','13212300'),('PESSOA3','13212377')

 -- uma terá apenas email
 INSERT INTO EMAIL(idPessoa,enderecoEmail)
 VALUES (3,'EMAIL3@EMAIL.COM')

 -- uma terá apenas telefone
 INSERT INTO TELEFONE (idPessoa,numeroTelefone)
 VALUES (4,'1134565445')

   
-- a ultima nao terá nada 
     /***
	  (Não é necessário realizar nada)
    ***/


--> Listar todas as pessoas que possuem
--email e telefone.

SELECT * 
FROM PESSOA 
JOIN EMAIL  ON (PESSOA.idPessoa = EMAIL.idPessoa)
JOIN TELEFONE ON (PESSOA.idPessoa = TELEFONE.idPessoa)



--> Listar todas as pessoas que nao possuem
--email nem telefone.

SELECT * 
FROM PESSOA 
LEFT JOIN EMAIL  ON (PESSOA.idPessoa = EMAIL.idPessoa)
LEFT JOIN TELEFONE ON (PESSOA.idPessoa = TELEFONE.idPessoa)
WHERE EMAIL.idPessoa IS NULL
AND TELEFONE.idPessoa IS NULL


-->Listar todas todas as pessoas que possuem
--email e nao possuem telefone.

SELECT * 
FROM PESSOA 
JOIN EMAIL  ON (PESSOA.idPessoa = EMAIL.idPessoa)
LEFT JOIN TELEFONE ON (PESSOA.idPessoa = TELEFONE.idPessoa)
WHERE TELEFONE.idPessoa IS NULL


--> Listar todas as pessoas que possuem telefone
-- e nao possuem email.

SELECT * 
FROM PESSOA 
JOIN TELEFONE  ON (PESSOA.idPessoa = TELEFONE.idPessoa)
LEFT JOIN EMAIL ON (PESSOA.idPessoa = EMAIL.idPessoa)
WHERE EMAIL.idPessoa IS NULL


--> Alterar a estrtura da tabela de email e telefone
-- para ter registro sem informar a pessoa, inserir
-- 1 registro por tabela.

 /***
    REMOVEMOS O FK PELO MODO DESIGNER.

 ****/

 INSERT INTO EMAIL (idPessoa,enderecoEmail)
 VALUES (NULL,'EMAILSEMPESSOA@GMAIL.COM')

 INSERT INTO TELEFONE (idPessoa,numeroTelefone)
 VALUES (NULL,'1100000000')
        

-->Exibir todas as relacoes entre as 3 tabelas.

SELECT *
FROM PESSOA
FULL OUTER JOIN TELEFONE ON (PESSOA.idPessoa = TELEFONE.idPessoa)
FULL OUTER JOIN EMAIL ON (PESSOA.idPessoa = EMAIL.idPessoa)