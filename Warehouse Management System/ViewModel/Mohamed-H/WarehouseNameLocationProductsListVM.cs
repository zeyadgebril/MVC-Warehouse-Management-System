using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.ViewModel.Mohamed_H
{
    public class WarehouseNameLocationProductsListVM
    {
        public string Name { get; set; }
        public string Location { get; set; }
        public List<ProductDetailsVM> Productsdetails { get; set; }
        public int ProductStock { get; set; }
        public int ProductCount => Productsdetails?.Count ?? 0;
        public int LowStock => Productsdetails?.Count(p => p.Quantity < p.MinAvailableStock) ?? 0;
        public DateTime? LastUpdate { get; set; }

    }
}
