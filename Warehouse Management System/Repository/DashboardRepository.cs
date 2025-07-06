using Warehouse_Management_System.Models;
using Warehouse_Management_System.ViewModel.Mohamed_H;

namespace Warehouse_Management_System.Repository
{
    public class DashboardRepository
    {
        dbContext Db;
        public DashboardRepository(dbContext db) {
            Db = db;
        }
        public UserDashboardVM GetDashboardData()
        {
            var vm = new UserDashboardVM
            {
                TotalWarehouses = Db.Warehouses.Count(w => w.isDeleted != true),
                TotalProducts = Db.Products.Count(p => p.IsDeleted != true),
                TotalSuppliers = Db.Suppliers.Count(s => s.isDeleted != true),
                TotalRevenue = Db.InventoryTransactions
                    .Where(t => t.TransactionType == "OUT" && t.isDeleted != true)
                    .Sum(t => (decimal?)t.Quantity * t.Product.UnitPrice) ?? 0,
                LowStockAlerts = Db.InventoryRecords.Count(r => r.QuantityOnHand < r.Product.MinAvailableStock && r.isDeleted != true),

                ProductMovements = Db.InventoryTransactions
                    .OrderByDescending(t => t.TimeStamp)
                    .Take(10)
                    .Select(t => new ProductMoveVM
                    {
                        ProductName = t.Product.Name,
                        WarehouseName = t.FromLocation.Warehouse.Name,
                        MoveType = t.TransactionType,
                        Quantity = t.Quantity ?? 0,
                        Date = t.TimeStamp ?? DateTime.MinValue
                    }).ToList(),

                TopSellingProducts = Db.InventoryTransactions
                    .Where(t => t.TransactionType == "OUT" && t.isDeleted != true)
                    .GroupBy(t => new
                    {
                        ProductId = t.ProductID,
                        ProductName = t.Product.Name,
                        WarehouseName = t.FromLocation.Warehouse.Name
                    })
                    .Select(g => new ProductDetailsVM
                    {
                        ProductId = g.Key.ProductId??0,
                        Name = g.Key.ProductName,
                        WarehouseName = g.Key.WarehouseName,
                        Quantity = g.Sum(t => t.Quantity ?? 0)
                    })
                    .OrderByDescending(p => p.Quantity)
                    .Take(5)
                    .ToList(),

                LowStockProducts = Db.InventoryRecords
                    .Where(r => r.QuantityOnHand < r.Product.MinAvailableStock && r.isDeleted != true)
                    .Select(r => new ProductDetailsVM
                    {
                        Name = r.Product.Name,
                        WarehouseName = r.Location.Warehouse.Name,
                        Quantity = r.QuantityOnHand??0
                    }).Take(5).ToList()
            };

            return vm;
        }
    }
}
