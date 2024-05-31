using SteamClone.Models;

namespace SteamClone.ViewModels
{
    public class NegozioViewModels
    {
        public List<Giochi> giochi { get; set; }

		public List<TipiGioco> tipigioco { get; set; }

		public NegozioViewModels(List<Giochi> Giochi, List<TipiGioco> TipiGioco) {
            giochi = Giochi;
            tipigioco = TipiGioco;
        }

    }
}
