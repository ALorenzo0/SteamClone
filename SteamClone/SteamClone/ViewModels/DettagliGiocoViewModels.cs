using SteamClone.Models;

namespace SteamClone.ViewModels
{
    public class DettagliGiocoViewModel
    {
        public Giochi gioco { get; set; }
        public List<Recensioni> commento { get; set; }

        public DettagliGiocoViewModel(Giochi Gioco, List<Recensioni> commento)
        {
            gioco = Gioco;
            this.commento = commento;
        }

    }
}
