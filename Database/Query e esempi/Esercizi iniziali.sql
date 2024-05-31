/*
1. Lista dei giochi con tipo "Avventura"
2. Lista dei giochi pegi 12
3. Lista dei giochi che necessitano di almeno 4GB di ram
4. Media delle recensioni per gioco 
5. Lista dei giochi per cui non sono disponibili i sottotitoli in italiano
*/


select * from dbo.giochi g
-- inner join
 INNER JOIN giochitipigioco gtg on g.IDgioco = gtg.idgioco
 inner join tipigioco tg on tg.idtipogioco = gtg.IDTipoGioco
 where tg.tipogioco = 'Avventura' 

 select * from dbo.giochi g
 INNER JOIN pegi pg on g.pegiID = pg.pegiID
 --INNER JOIN pegi pg on g.Idpegi = pg.idpegi
 where pg.pegiID = 3

  select * from dbo.giochi g --lista dei giochi che necessitano di almeno 4GB di ram
  INNER JOIN reqmin rq on g.IDgioco = rq.idgioco
  where memory >= 24

  select idgioco, media = AVG (valutazione)  --media recensioni per gioco
 from recensioni
 group by idgioco

 select * from dbo.giochi g --Lista dei giochi per cui non sono disponibili i sottotitoli in italiano
 left JOIN giochilingue gl on g.IDgioco = gl.idgioco and gl.idlingua = 1
left JOIN lingue l on l.IDlingua = gl.IDlingua
 where gl.sottotitoli = 0 or gl.sottotitoli is null