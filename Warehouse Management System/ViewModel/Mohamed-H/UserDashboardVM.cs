namespace Warehouse_Management_System.ViewModel.Mohamed_H
{
    public class UserDashboardVM
    {
        public int TotalWarehouses { get; set; }
        public int TotalProducts { get; set; }
        public int TotalSuppliers { get; set; }
        public decimal TotalRevenue { get; set; }
        public int LowStockAlerts { get; set; }

        public List<ProductMoveVM> ProductMovements { get; set; }
        public List<ProductDetailsVM> TopSellingProducts { get; set; }
        public List<ProductDetailsVM> LowStockProducts { get; set; }
    }
}
