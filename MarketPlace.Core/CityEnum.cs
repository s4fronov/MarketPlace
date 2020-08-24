using System.ComponentModel;

namespace MarketPlace.Core
{
    public enum City
    {
        Moscow = 1,
        [Description("Saint-Petersburg")] SaintPetersburg,
        Novosibirsk,
        Khabarovsk,
        Ekaterinurg,
        Samara,
        [Description("Rostov-na-Donu")] RostovNaDonu,
        Kaliningrad
    }
}
