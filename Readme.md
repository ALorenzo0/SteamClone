# STEAMCLONE

	SteamClone è un sito web che ricrea il sito originale di Steam, con diverse funzionalità
	semplificate ed un interfaccia utente intuitiva e coinvolgente.
	
# COME SI USA

	1. Scaricare il pacchetto:
		- cliccare sul pulsante "code".
		- clicca "scarica ZIP" per iniziare il download.
		
	2. Scompatta il file ZIP.
	
	3. Apri la cartella "Database":
		- apri il file "ScriptDB" su SQL che contiene tutte le tabelle ed eseguile.
		- entra nella cartella "Query e esempi" e apri le ultime 3 query.
	
	4. Apri la cartella "SteamClone":
		- apri il file "SteamClone" in Microsoft Visual Studio.
		- apri il sito web premendo il pulsante la "freccia verde".
		
		 
		 
# REQUISITI

	1. Microsoft SQL Server Management Studio.
	2. Microsoft Visual Studio.
	
	

# CODICE

	```sql
	insert into dbo.tipigioco (Idtipogioco, tipogioco )
	 values 
	  (1, 'sparatutto')
	 ,(2, 'avventura')
	 ,(3, 'di ruolo')
	 ,(4, 'strategia')
	 ,(5, 'open world')
	 
	 ```