namespace SteamClone.Models
{
    public class Giochi
    {
        public int idgioco { get; set; }

        public string immagine { get; set; }

        public string gioco { get; set; }

		public string descrizione { get; set; }

        public int mediarecensioni { get; set; }

        public string tipogioco { get; set; }

        public string pegi { get; set; }

        public decimal prezzo { get; set; }
	}
}
