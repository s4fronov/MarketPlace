using System.Collections.Generic;
using MarketPlace.Data.DTO;
using MarketPlace.Core;

namespace MarketPlace.Data
{
    internal class Categorization
    {
        public List<ProductDto> AddCategoriesToProducts(List<ProductDto> products)
        {
            products.ForEach(p =>
            {
                if (p.QuickDefrostFunction.HasValue) 
                    p.CategoryId = (int)Category.Refrigerator;
                if (p.MaxTemperature.HasValue && !p.GrillFunction.HasValue && !p.SmartHomeFunction.HasValue) 
                    p.CategoryId = (int)Category.Stove;
                if (p.MaxTemperature.HasValue && p.GrillFunction.HasValue)
                    p.CategoryId = (int)Category.Oven;
                if (!p.MaxTemperature.HasValue && p.GrillFunction.HasValue)
                    p.CategoryId = (int)Category.Microwave;
                if (p.MaxTemperature.HasValue && !p.GrillFunction.HasValue && p.SmartHomeFunction.HasValue)
                    p.CategoryId = (int)Category.Multicooker;
                if (!p.NumberOfModes.HasValue && !p.MiniJack.HasValue)
                    p.CategoryId = (int)Category.Teapot;
                if (p.SteamGeneratorFunction.HasValue && !p.SmartHomeFunction.HasValue)
                    p.CategoryId = (int)Category.Iron;
                if (p.WetCleaningFunction.HasValue && !p.SmartHomeFunction.HasValue)
                    p.CategoryId = (int)Category.VacuumCleaner;
                if (p.WetCleaningFunction.HasValue && p.SmartHomeFunction.HasValue)
                    p.CategoryId = (int)Category.RobotVacuumCleaner;
                if (p.SteamGeneratorFunction.HasValue && p.SmartHomeFunction.HasValue)
                    p.CategoryId = (int)Category.AirConditioning;
                if (p.TvFunction.HasValue && p.MemorySize.HasValue)
                    p.CategoryId = (int)Category.Television;
                if (p.TvFunction.HasValue && !p.MemorySize.HasValue)
                    p.CategoryId = (int)Category.Monitor;
                if (p.Jack.HasValue)
                    p.CategoryId = (int)Category.AudioSystem;
                if (p.LTE.HasValue && !p.TabletMode.HasValue)
                    p.CategoryId = (int)Category.Smartphone;
                if (p.LTE.HasValue && p.TabletMode.HasValue)
                    p.CategoryId = (int)Category.Tablet;
                if (!p.LTE.HasValue && p.TabletMode.HasValue)
                    p.CategoryId = (int)Category.Notebook;
                if (p.CameraFunction.HasValue && !p.MiniJack.HasValue)
                    p.CategoryId = (int)Category.Camera;
            });
            return products;
        }
    }
}
