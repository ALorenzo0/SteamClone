

--inner JOIN giochitipigioco gtg on g.IDgioco = gtg.idgioco


select 
idrecensione, 
idutente, 
gioco,
valutazione,
recensione
from dbo.recensioni r
INNER JOIN giochi g on r.IDGioco = g.IDGioco
 --INNER JOIN pegi pg on g.Idpegi = pg.idpegi


-- SELECT ProductID, ProductName, CategoryName
--FROM Products
--INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;


SELECT g.idgioco, gioco, immagine, descrizione, mediarecensioni=isnull(avg(r.valutazione),-1) FROM Giochi g
left join recensioni r on r.IDGioco = g.IDGioco
group by g.idgioco, gioco, immagine, descrizione


SELECT * FROM Giochi g
left join recensioni r on r.IDGioco = g.IDGioco

SELECT 
g.idgioco,
gioco,
immagine,
descrizione
FROM Giochi g
WHERE
	IDGioco = @idgioco



select distinct top 4 g.idgioco, recensione  from dbo.giochi g
left join recensioni r on r.IDGioco = g.IDGioco
 order by recensione


 select top 4
g.idgioco,
gioco,
immagine,
descrizione,
mediarecensioni=isnull(avg(r.valutazione),-1)
FROM Giochi g
left join recensioni r on r.IDGioco = g.IDGioco
group by g.idgioco, gioco, immagine, descrizione
order by mediarecensioni desc

select idtipogioco, tipogioco from TipiGioco



SELECT distinct
    g.idgioco,
    gioco,
    immagine,
    descrizione,
	tg.tipogioco
FROM 
    Giochi g
	inner join giochitipigioco gg on gg.idgioco = g.idgioco
	inner join tipigioco tg on tg.idtipogioco = gg.idtipogioco
WHERE
	IDTipoGioco = @idtipogioco



select * from tipigioco
select * from GiochiTipiGioco
select * from giochi




select p.pegi, pegiid from giochi g
inner join pegi p on p.pegiid = g.pegi




SELECT distinct
    g.idgioco,
    gioco,
    immagine,
    descrizione,
	tg.tipogioco,
    p.descrizione
FROM 
    Giochi g
	inner join giochitipigioco gg on gg.idgioco = g.idgioco
	inner join tipigioco tg on tg.idtipogioco = gg.idtipogioco
    left join pegi p on p.pegiid= g.pegiid
WHERE
	gg.idtipogioco = @idtipogioco





SELECT 
idgioco,
gioco,
immagine,
g.descrizione,
pegi = p.descrizione,
prezzo
FROM
giochi g
left join pegi p on p.pegiid= g.pegiid