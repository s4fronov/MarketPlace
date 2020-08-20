using Autofac;
using MarketPlace.Core;
using MarketPlace.Data;

namespace MarketPlace.API.Configuration
{
    public class AutofacModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<StorageOptions>().As<IStorageOptions>();
            builder.RegisterType<ProductRepository>().As<IProductRepository>();
        }
    }
}
