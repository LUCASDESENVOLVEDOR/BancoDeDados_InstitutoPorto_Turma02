

ALTER PROCEDURE  SPI_MARCA 
@nomeMarca varchar(40)

as
begin


IF NOT EXISTS( SELECT * 
               FROM MARCA 
			   WHERE nomeMarca = @nomeMarca)
BEGIN
        
	INSERT INTO MARCA (nomeMarca)
	VALUES (@nomeMarca)

	SELECT 1
END
ELSE 
BEGIN

   SELECT 0
END 




end
