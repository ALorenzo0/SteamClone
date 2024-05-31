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
				string query = "SELECT idgioco, gioco, immagine FROM Giochi";
				var giochi = connection.Query<Giochi>(query).ToList();
				return giochi;
			}
		}
	}
}


