namespace MarketPlace.Data
{
    public static class StoredProcedures
    {
        public const string ProductAdd = "Product_Add"; 
        public const string ProductGetAll = "Product_GetAll";
        public const string ProductGetById = "Product_GetById";
        public const string ProductUpdatePrice = "Product_UpdatePrice";
        public const string ProductFindByName = "Product_FindByName";

        public const string OrderAdd = "Order_Add";
        public const string AddProductInOrder = "AddProductInOrder";
        public const string GetProductsInOrderByOrderId = "GetProductsInOrderByOrderId";
    }
}
