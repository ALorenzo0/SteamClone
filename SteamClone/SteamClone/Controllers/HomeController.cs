using Microsoft.AspNetCore.Mvc;
using SteamClone.Models;
using System.Diagnostics;
using SteamClone.ViewModels;
using SteamClone.Data;
using System.Configuration;

namespace SteamClone.Controllers
{
	public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
		private readonly IConfiguration _config;

		public HomeController(ILogger<HomeController> logger, IConfiguration config)
        {
            _logger = logger;
            _config = config; 
        }

        public IActionResult ASSISTENZA()
        {
            return View();
        }

        public IActionResult NEGOZIO()
        {
            string dbConnectionString = _config.GetValue<string>("ConnectionString:Value");

            SQLData data = new SQLData(dbConnectionString);
           
            List<Giochi> giochi = new List<Giochi>();
            
            giochi = data.CaricaGiochi();

			List<TipiGioco> tipigioco = new List<TipiGioco>();

			tipigioco = data.CaricaTipiGioco();

			return View(new NegozioViewModels(giochi, tipigioco));
        }


        public IActionResult COMMUNITY()
        {
			string dbConnectionString = _config.GetValue<string>("ConnectionString:Value");

			SQLData data = new SQLData(dbConnectionString);


            List<Recensioni> commento = new List<Recensioni>();

            commento = data.CaricaCommenti();

            return View(new RecensioniViewModels(commento));
        }

        public IActionResult INFORMAZIONI()
        {
            return View();
        }

		public IActionResult DETTAGLIGIOCO(int idgioco)
		{
			string dbConnectionString = _config.GetValue<string>("ConnectionString:Value");

			SQLData data = new SQLData(dbConnectionString);


			Giochi gioco = new Giochi();
            gioco = data.CaricaGioco(idgioco);

            List<Recensioni> commento = new List<Recensioni>();
            commento = data.CaricaRecensioni(idgioco);

            return View(new DettagliGiocoViewModel(gioco,commento));
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

		public IActionResult CATEGORIE(int idtipogioco)
		{
			string dbConnectionString = _config.GetValue<string>("ConnectionString:Value");

			SQLData data = new SQLData(dbConnectionString);


			List<Giochi> giochi = new List<Giochi>();

			giochi = data.CaricaGiochiByCategoria(idtipogioco);

			List<TipiGioco> tipigioco = new List<TipiGioco>();

			return View(new NegozioViewModels(giochi, tipigioco));
		}
	}
}
