using Warehouse_Management_System.Models;
using Warehouse_Management_System.ViewModel.Mohamed_H;

namespace Warehouse_Management_System.Repository
{
    public class WarehouseRepository : Repository<Warehouse>
    {
        public WarehouseRepository(MvcDbContextContext db) : base(db)
        {
            
        }

        public List<WarehouseNameLocationProductsListVM> GetWarehouseDetails()
        {
            var warehouseResult = (from warehouse in Db.Warehouses
                                   where warehouse.isDeleted != true
                                   select new WarehouseNameLocationProductsListVM
                                   {
                                       Name = warehouse.Name,
                                       Location = warehouse.Location,
                                       Productsdetails = (from il in warehouse.InventoryLocations
                                                   join ir in Db.InventoryRecords
                                                   on il.LocationID equals ir.LocationId
                                                   join p in Db.Products on ir.ProductId equals p.ProductId
                                                   where p.IsDeleted != true && !ir.isDeleted != true
                                                   select new ProductDetailsVM
                                                   {
                                                       Name = p.Name,
                                                       Quantity = ir.QuantityOnHand??0,
                                                       MinAvailableStock = p.MinAvailableStock ?? 0,
                                                       LastUpdate = ir.LastUpdated,
                                                   }).GroupBy(p => p.Name).Select(g => g.First()).ToList()


                                   }).ToList();
            return warehouseResult;
        }

    }


}
