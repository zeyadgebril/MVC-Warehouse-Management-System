using System.Diagnostics;
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
                                       ID = warehouse.WarehouseID,
                                       Name = warehouse.Name,
                                       Location = warehouse.Location,
                                       Phone=warehouse.ContactPhone,

                                       Productsdetails = (
                                           from il in Db.InventoryLocations
                                           where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
                                           join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
                                           where ir.isDeleted != true
                                           join p in Db.Products on ir.ProductId equals p.ProductId
                                           where p.IsDeleted != true
                                           select new ProductDetailsVM
                                           {
                                               Name = p.Name,
                                               Quantity = ir.QuantityOnHand??0,
                                               MinAvailableStock = p.MinAvailableStock ?? 0,
                                               LastUpdate = ir.LastUpdated
                                           }
                                       ).ToList(),

                                       // Count of distinct products by name
                                           ProductCount = (
                                           from il in Db.InventoryLocations
                                           where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
                                           join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
                                           where ir.isDeleted != true
                                           join p in Db.Products on ir.ProductId equals p.ProductId
                                           where p.IsDeleted != true
                                           select p.Name
                                       ).Distinct().Count(),

                                       // Count of low-stock products
                                       LowStockCount = (
                                           from il in Db.InventoryLocations
                                           where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
                                           join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
                                           where ir.isDeleted != true
                                           join p in Db.Products on ir.ProductId equals p.ProductId
                                           where p.IsDeleted != true && ir.QuantityOnHand < (p.MinAvailableStock ?? 0)
                                           select p.Name
                                       ).Distinct().Count(),

                                       // Last update timestamp in warehouse
                                       LastUpdate = (
                                           from il in Db.InventoryLocations
                                           where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
                                           join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
                                           where ir.isDeleted != true
                                           select ir.LastUpdated
                                       ).OrderByDescending(x => x).FirstOrDefault()
                                   }).ToList();

            return warehouseResult;
        }
        //product by warehouse ID
        public List<ProductDetailsVM> GetProductDetailsForWarehouse(int warehouseId)
        {
            var productList = (from il in Db.InventoryLocations
                          where il.WarehouseID == warehouseId && il.isDeleted != true
                          join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
                          where ir.isDeleted != true
                          join p in Db.Products on ir.ProductId equals p.ProductId
                          where p.IsDeleted != true
                          join c in Db.Categories on p.CategoryId equals c.CategoryID
                          where c.isDeleted != true
                          join sp in Db.Supplier_Products on p.ProductId equals sp.ProductId
                          where sp.isDeleted != true
                          join s in Db.Suppliers on sp.SupplierID equals s.SupplierID
                          where s.isDeleted != true
                               select new ProductDetailsVM
                          {
                              ProductId = p.ProductId,
                              Name = p.Name,
                              Quantity = ir.QuantityOnHand ?? 0,
                              MinAvailableStock = p.MinAvailableStock ?? 0,
                              LastUpdate = ir.LastUpdated,
                              Price = p.UnitPrice??0,
                              Category = c.Name,
                              Supplier = s.Name


                          }).ToList();


            return productList;
        }


        public bool MoveProductStock(ProductMoveVM productmoveVM)
        {
            string moveType = productmoveVM.MoveType?.Trim().ToUpper();

            if (moveType != "IN" && moveType != "OUT")
                return false;

            var record = (from ir in Db.InventoryRecords
                          join il in Db.InventoryLocations on ir.LocationId equals il.LocationID
                          where ir.ProductId == productmoveVM.ProductId &&
                                il.WarehouseID == productmoveVM.WarehouseId &&
                                ir.isDeleted != true &&
                                il.isDeleted != true
                          select ir).FirstOrDefault();

            if (record == null)
                return false;

            if (moveType == "IN")
            {
                record.QuantityOnHand += productmoveVM.Quantity;
            }
            else // moveType == "OUT"
            {
                if (record.QuantityOnHand < productmoveVM.Quantity)
                    return false;
                record.QuantityOnHand -= productmoveVM.Quantity;
            }

            record.LastUpdated = DateTime.Now;

            var transaction = new InventoryTransaction
            {
                ProductID = productmoveVM.ProductId,
                Quantity = productmoveVM.Quantity,
                TimeStamp = DateTime.Now,
                TransactionType = moveType, // ✅ validated and uppercased
                FromLocationID = record.LocationId
            };

            Db.InventoryTransactions.Add(transaction);
            return true;
        }


    }


}
