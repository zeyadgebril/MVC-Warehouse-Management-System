namespace Warehouse_Management_System.ViewModel.Mohamed_H
{
    public class ProductDetailsVM
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public string WarehouseName { get; set; }

        public int Quantity { get; set; }
        public int MinAvailableStock { get; set; }
        public string? Category { get; set; }
        public string? Supplier { get; set; }
        public decimal Price { get; set; }
        public DateTime? LastUpdate { get; set; }
        public bool IsDeleted { get; set; }

    }
}
