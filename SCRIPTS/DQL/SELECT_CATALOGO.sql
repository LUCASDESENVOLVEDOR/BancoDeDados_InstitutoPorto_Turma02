USE CATALOGO 

--LISTAR TODOS OS FILMES, MOSTRANDO O NOME
--DO GENERO DE CADA UM MESMO QUE UM FILME
--NAO POSSUA UM GENERO ATRELADO

SELECT *
FROM FILME 
LEFT JOIN GENERO ON (FILME.idGenero = GENERO.idGenero)


--LISTAR SOMENTE OS FILMES QUE POSSUEM GENERO, TRAZENDO TAMBEM
--TODOS OS GENEROS QUE NAO REPRESENTEM UM FILME

SELECT *
FROM FILME 
RIGHT JOIN GENERO ON (FILME.idGenero = GENERO.idGenero)

--LISTAR SOMENTE OS FILMES QUE POSSUEM UM GENERO DEFINIDO
SELECT *
FROM FILME 
INNER JOIN GENERO ON (FILME.idGenero = GENERO.idGenero)

--LISTAR TODOS OS FILMES E TODOS OS GENEROS 
--MESMO QUE NAO HAJA CORRESPONDENCIA ENTRE ELES
SELECT *
FROM FILME 
FULL OUTER JOIN GENERO ON (FILME.idGenero = GENERO.idGenero)

