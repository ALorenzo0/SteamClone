using Microsoft.AspNetCore.Mvc;
using SteamClone.Models;
using System.Diagnostics;
using SteamClone.ViewModels;
using SteamClone.Data;

namespace SteamClone.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult COMMUNITY()
        {
            return View();
        }

        public IActionResult ASSISTENZA()
        {
            return View();
        }

        public IActionResult NEGOZIO()
        {
            SQLData data = new SQLData("Data Source=localhost;Initial Catalog=Steam;uid=sa; password=Isolutions2021;Encrypt=False");
           

            List<Giochi> giochi = new List<Giochi>();
            
            giochi = data.CaricaGiochi();

			return View(new GiochiViewModels(giochi));
        }

        public IActionResult INFORMAZIONI()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
