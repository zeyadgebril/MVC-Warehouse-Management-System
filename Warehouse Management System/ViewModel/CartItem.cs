namespace Warehouse_Management_System.CheckOutViewModels
{
    public class CartItem
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public decimal UnitPrice { get; set; }
        public int Quantity { get; set; } = 1;

        public int AvailableStock { get; set; }

        public int CategoryId { get; set; } 

    }
}
