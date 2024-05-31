using SteamClone.Models;

namespace SteamClone.ViewModels
{
    public class RecensioniViewModels
    {
        public List<Recensioni> commento { get; set; }

        public RecensioniViewModels(List<Recensioni> Commento) {
            commento = Commento;
        }

    }
}
