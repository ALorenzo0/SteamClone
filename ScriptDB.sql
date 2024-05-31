use steam
--se lo lancio con 1 lo ricreo, se lo lancio con 2 cancello tutto, se lo lancio con 3 lo popolo,  se lo lancio con 4 elimina il contenuto
declare @tipoesecuzione int = 3

if @tipoesecuzione = 1 
begin 
	create table dbo.Giochi (IDGioco INT, Gioco varchar(50), descrizione varchar(max), prezzo decimal(16,2), immagine VARCHAR(MAX) ,/*can be null*/ pegiID int, primary key (Idgioco))
	create table dbo.TipiGioco (IDTipoGioco INT, TipoGioco varchar(50) primary key (Idtipogioco))
	create table dbo.GiochiTipiGioco (IDTipoGioco INT, IDgioco INT)
	create table dbo.Recensioni (IDRecensione int, IDGioco INT, IDutente INT, recensione varchar(500), valutazione int)
	create table dbo.ReqMin (IDGioco INT, OS varchar(30), Processor varchar(30), Memory int, Graphics varchar(30), DirectX varchar(30), Storage int, Notes varchar(100))
	create table dbo.GiochiLingue (IDgioco INT, IDlingua INT,interfaccia bit, Audio bit, sottotitoli bit)
	create table dbo.Lingue (IDLingua INT, lingua varchar(20) primary key (IDlingua))
	create table dbo.Pegi (pegiID int, descrizione varchar(20), primary key (pegiID))
	
	alter table dbo.giochitipigioco add foreign key(IDgioco) references dbo.giochi(IDgioco)
	alter table dbo.giochi add foreign key(pegiID) references dbo.pegi(pegiID)
	alter table dbo.giochitipigioco add foreign key(IDTipoGioco) references dbo.tipigioco(IDtipogioco)
	alter table dbo.GiochiLingue add foreign key(IDgioco) references dbo.giochi(IDgioco)
	alter table dbo.giochilingue add foreign key(IDlingua) references dbo.lingue(IDlingua)
	alter table dbo.ReqMin add foreign key(IDgioco) references dbo.giochi(IDgioco)
	alter table dbo.Recensioni add foreign key(IDgioco) references dbo.giochi(IDgioco)
end




if @tipoesecuzione = 3 
begin 

	insert into dbo.pegi (pegiID, descrizione)
	values 
	 (1, 'pegi 3'),
	 (2, 'pegi 7'),
	 (3, 'pegi 12'),
	 (4, 'pegi 16'),
	 (5, 'pegi 18')

	 insert into dbo.tipigioco (Idtipogioco, tipogioco )
	 values 
	  (1, 'sparatutto')
	 ,(2, 'avventura')
	 ,(3, 'di ruolo')
	 ,(4, 'strategia')
	 ,(5, 'open world')

	insert into dbo.giochi (IDgioco, Gioco, descrizione, prezzo, immagine , pegiID)
	values
	 (1, 'Fortnite', 'Fortnite è una piattaforma di gioco online del 2017, sviluppato da People Can Fly e pubblicato da Epic Games per console e PC. Il gioco presenta modalità distinte che condividono lo stesso motore grafico: Salva il mondo, Battaglia reale, Modalità creativa, LEGO Fortnite, Rocket Racing e Fortnite Festival.', 20.99,' https://www.xtrafondos.com/wallpapers/battle-pass-skins-fortnite-capitulo-2-temporada-8-8731.jpg', 1)  --non c'è su steam
	,(2, 'Minecraft', 'Fatti strada combattendo in una entusiasmante avventura ispirata ai classici dungeon crawler e ambientata nell universo di Minecraft!', 10.99,'https://cdn.akamai.steamstatic.com/steam/apps/1672970/header.jpg?t=1715792276', 1) --Minecraft Dungeons
	,(3, 'Cyberpunk 2077', 'Cyberpunk 2077 è un GDR d azione a mondo aperto ambientato nell oscuro futuro a Night City, una pericolosa megalopoli ossessionata dal potere, dalla moda e dalle modifiche cibernetiche.', 50.99,' https://cdn.akamai.steamstatic.com/steam/apps/1091500/capsule_616x353.jpg?t=1715334241', 2)
	,(4, 'Wow', 'Immergiti in emozionanti battaglie navali e raduna un armata composta da più di 600 navi della prima metà del XX secolo, dai furtivi cacciatorpediniere alle enormi corazzate. Cambia l aspetto delle tue navi, scegli i potenziamenti che preferisci e scendi in battaglia con altri giocatori!', 70.99,'https://cdn.akamai.steamstatic.com/steam/apps/552990/header.jpg?t=1715879561', 3) --World of Warships
	,(5, 'assassins creed', 'Forgia il tuo destino in Assassins Creed® Odyssey. Vivi una vera e propria odissea per svelare i segreti del tuo passato, cambia il destino dell antica Grecia e diventa una leggenda vivente.', 30.99,'https://cdn.akamai.steamstatic.com/steam/apps/812140/header.jpg?t=1692034673', 1)
	,(6, 'Dota 2', 'Ogni giorno, milioni di giocatori in tutto il mondo si uniscono alla battaglia nei panni di uno degli oltre cento Eroi di Dota. E non importa se è la loro decima o la loro millesima ora di gioco... ci sarà sempre qualcosa di nuovo da scoprire.', 4.99,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/570/header.jpg?t=1714502360', 1)  --Dota 2
	,(7, 'Euro Truck Simulator 2', 'Viaggia attraverso l Europa nei panni del re della strada, un camionista che trasporta carichi importanti su distanze impressionanti! Con decine di città da esplorare, la tua resistenza, abilità e velocità saranno spinte al limite.', 4.99,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/227300/header.jpg?t=1716524980', 1) --Euro Truck Simulator 2
	,(8, 'ELDEN RING', 'UN NUOVO ACTION RPG FANTASY. Alzati, Senzaluce, e lasciati guidare dalla grazia verso la conquista dell Anello ancestrale, il cui potere ti renderà lord dell Interregno.', 59.99,' https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/header.jpg?t=1716311593', 2) --Elden Ring
	,(9, 'F1® 24', 'Scendi in pista ed entra a far parte dei 20. Guida come i migliori in EA SPORTS™ F1® 24, il videogioco ufficiale del 2024 FIA Formula One World Championship™.', 69.99,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2488620/header.jpg?t=1716201283', 3) --F1
	,(10, 'The Elder Scrolls V: Skyrim Special Edition', 'Vincitore di oltre 200 premi Gioco dell’Anno, The Elder Scrolls V: Skyrim Special Edition porta sui vostri schermi il fantasy epico con dettagli mozzafiato. La Special Edition include l’acclamato gioco e gli add-on con nuove funzioni.', 7.99,'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/489830/header.jpg?t=1701807334', 1) --The Elder Scrolls V: Skyrim Special Edition

	insert into dbo.giochitipigioco (IDtipogioco, IDgioco)
	 values 
	  (2, 2)
	 ,(1, 3)
	 ,(2, 3)
	 ,(1, 4)
	 ,(5, 5)
	 ,(2, 5)
	 ,(3, 4)
	 ,(4, 6)
	 ,(5, 7)
	 ,(5, 8)
	 ,(2, 9)
	 ,(2, 10)
	 ,(5, 10)
	insert into dbo.recensioni (IDrecensione, IDgioco, IDutente, recensione, valutazione)
	values 
	 (1, 1, 1, 'interessante', 1)
	,(2, 2, 1, 'bello', 2)
	,(3, 3, 2, 'ci sta', 3)
	,(4, 4, 2, 'onesto', 4)
	,(5, 5, 2, 'molto brutto', 5)
	,(6, 6, 1, 'interessante', 1)
	,(7, 7, 1, 'bello', 2)
	,(8, 8, 2, 'ci sta', 3)
	,(9, 9, 2, 'onesto', 4)
	,(10, 10, 2, 'molto brutto', 1)
	insert into dbo.reqmin(Idgioco, os, processor, memory, graphics, directx, storage, notes)
	values 
	 (1, 'windows 10', 'intel', 12, 'geforce', 'version 12', 100, 'gioco'  )
	,(2, 'windows 10', 'intel', 24, 'geforce', 'version 11', 50, 'gioco'  )
	,(3, 'windows 10', 'intel', 32, 'geforce', 'version 12', 25, 'gioco'  )
	,(4, 'windows 10', 'intel', 8, 'geforce', 'version 12', 50, 'gioco'  )
	,(5, 'windows 10', 'intel', 16, 'geforce', 'version 12', 25, 'gioco'  )
	
	insert into dbo.lingue(IDlingua, lingua)
	values 
	 (1, 'italiano')
	,(2, 'inglese')
	,(3, 'francese')
	,(4, 'tedesco')
	,(5, 'spagnolo')
	
	insert into dbo.giochilingue (IDgioco, IDlingua, interfaccia, audio, sottotitoli)
	values 
	 (1, 2, 1, 0, 0)
	 --,(1, 1, 1, 0, 0)
	 ,(1, 3, 1, 0, 0)
	 ,(1, 4, 1, 0, 0)
	 ,(1, 5, 1, 0, 0)

	,(2, 2, 1, 0, 0)
	,(2, 1, 1, 0, 0)
	,(2, 3, 1, 0, 0)
	,(2, 4, 1, 0, 0)
	,(2, 5, 1, 0, 0)

	,(3, 2, 1, 1, 1)
	,(3, 1, 1, 1, 1)
	,(3, 3, 1, 1, 1)
	,(3, 4, 1, 1, 0)
	,(3, 5, 1, 1, 0)

	,(4, 2, 1, 0, 0)
	,(4, 1, 1, 0, 0)
	,(4, 3, 1, 0, 0)
	,(4, 4, 1, 0, 0)
	,(4, 5, 1, 0, 0)

	,(5, 2, 1, 1, 1)
	,(5, 1, 1, 1, 0)
	,(5, 3, 1, 1, 1)
	,(5, 4, 1, 1, 1)
	,(5, 5, 1, 1, 0)

end



if @tipoesecuzione = 4
begin 
	delete from dbo.giochitipigioco
	delete from dbo.recensioni
	delete from dbo.reqmin
	delete from dbo.giochilingue
	delete from dbo.lingue
	delete from dbo.tipigioco
	delete from dbo.giochi
	delete from dbo.pegi
end
  
if @tipoesecuzione = 2
begin
	drop table dbo.giochitipigioco
	drop table dbo.recensioni
	drop table dbo.reqmin
	drop table dbo.giochilingue
	drop table dbo.giochi
	drop table dbo.pegi
	drop table dbo.lingue
	drop table dbo.tipigioco
end
