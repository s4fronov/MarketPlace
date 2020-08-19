using System;
using System.Collections.Generic;
using System.Text;

namespace MarketPlace.Core
{
    public interface IStorageOptions
    {
        string DBConnectionString { get; set; }
    }
}
