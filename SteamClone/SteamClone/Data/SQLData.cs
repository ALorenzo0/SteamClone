using SteamClone.Models;
using System.Security.Cryptography.X509Certificates;
using Microsoft.Data.SqlClient;
using Dapper;

namespace SteamClone.Data
{
    public class SQLData
    {
        private readonly string _connectionString;

        public SQLData(string connectionString)
        {
            _connectionString = connectionString;
        }

        public List<Giochi> CaricaGiochi()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
 select top 4
g.idgioco,
gioco,
immagine,
descrizione,
mediarecensioni=isnull(avg(r.valutazione),-1),
prezzo
FROM Giochi g
left join recensioni r on r.IDGioco = g.IDGioco
group by g.idgioco, gioco, immagine, descrizione, prezzo
order by mediarecensioni desc";
                var giochi = connection.Query<Giochi>(query).ToList();
                return giochi;
            }
        }



        public List<Recensioni> CaricaCommenti()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
select 
idrecensione, 
idutente, 
gioco,
valutazione,
recensione
from dbo.recensioni r
INNER JOIN giochi g on r.IDGioco = g.IDGioco";

                var commenti = connection.Query<Recensioni>(query).ToList();
                return commenti;
            }
        }

        public Giochi CaricaGioco(int idgioco)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
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
WHERE
	g.IDGioco = @idgioco";
                var giochi = connection.QuerySingle<Giochi>(query, new {idgioco});
                return giochi;
            }
        }

        public List<Recensioni> CaricaRecensioni(int idgioco)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string query = @"
select 
idrecensione, 
idutente, 
gioco,
valutazione,
recensione
from dbo.recensioni r
INNER JOIN giochi g on r.IDGioco = g.IDGioco
WHERE r.IDGioco = @idgioco";

                var commenti = connection.Query<Recensioni>(query, new { idgioco}).ToList();
                return commenti;
            }
        }

		public List<TipiGioco> CaricaTipiGioco()
		{
			using (var connection = new SqlConnection(_connectionString))
			{
				string query = @"
select idtipogioco, tipogioco from TipiGioco";
				var giochi = connection.Query<TipiGioco>(query).ToList();
				return giochi;
			}
		}

		public List<Giochi> CaricaGiochiByCategoria(int idtipogioco)
        {
			using (var connection = new SqlConnection(_connectionString))
			{
				string query = @"
SELECT distinct
    g.idgioco,
    gioco,
    immagine,
    descrizione,
	tg.tipogioco,
    prezzo
FROM 
    Giochi g
	inner join giochitipigioco gg on gg.idgioco = g.idgioco
	inner join tipigioco tg on tg.idtipogioco = gg.idtipogioco
WHERE
	gg.idtipogioco = @idtipogioco";
				var giochi = connection.Query<Giochi>(query, new { idtipogioco }).ToList();
				return giochi;
			}

	}

		public List<TipiGioco> ScriviCommento()
		{
			using (var connection = new SqlConnection(_connectionString))
			{
				string query = @"
select idtipogioco, tipogioco from TipiGioco";
				var giochi = connection.Query<TipiGioco>(query).ToList();
				return giochi;
			}
		}
	}
}