using SteamClone.Models;

namespace SteamClone.ViewModels
{
    public class GiochiViewModels
    {
        public List<Giochi> giochi { get; set; }

        public GiochiViewModels(List<Giochi> Giochi) {
            giochi = Giochi;
        }

    }
}
