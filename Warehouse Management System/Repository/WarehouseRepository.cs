using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.ViewModel.Mohamed_H;

namespace Warehouse_Management_System.Repository
{
    public class WarehouseRepository : Repository<Warehouse>
    {
        private readonly dbContext Db;

        public WarehouseRepository(dbContext db) : base(db)
        {
            this.Db = db;
        }
        //public List<WarehouseNameLocationProductsListVM> GetWarehouseDetails()
        //{
        //    var warehouseResult = (from warehouse in Db.Warehouses
        //                           where warehouse.isDeleted != true
        //                           select new WarehouseNameLocationProductsListVM
        //                           {
        //                               ID = warehouse.WarehouseID,
        //                               Name = warehouse.Name,
        //                               Location = warehouse.Location,
        //                               Phone = warehouse.ContactPhone,

        //                               TotalSuppliers = (
        //                                    from sp in Db.Supplier_Products
        //                                    join p in Db.Products on sp.ProductId equals p.ProductId
        //                                    join ir in Db.InventoryRecords on p.ProductId equals ir.ProductId
        //                                    join il in Db.InventoryLocations on ir.LocationId equals il.LocationID
        //                                    where il.WarehouseID == warehouse.WarehouseID &&
        //                                          sp.isDeleted != true &&
        //                                          p.IsDeleted != true &&
        //                                          ir.isDeleted != true &&
        //                                          il.isDeleted != true
        //                                    select sp.SupplierID
        //                                ).Distinct().Count(),
        //                               TotalRevenue = (
        //                                    from ir in Db.InventoryRecords
        //                                    join p in Db.Products on ir.ProductId equals p.ProductId
        //                                    where ir.isDeleted != true && p.IsDeleted != true
        //                                    select (p.UnitPrice ?? 0) * (ir.QuantityOnHand ?? 0)
        //                                ).Sum(),


        //                               Productsdetails = (
        //                                   from il in Db.InventoryLocations
        //                                   where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
        //                                   join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
        //                                   where ir.isDeleted != true
        //                                   join p in Db.Products on ir.ProductId equals p.ProductId
        //                                   where p.IsDeleted != true
        //                                   select new ProductDetailsVM
        //                                   {
        //                                       Name = p.Name,
        //                                       Quantity = ir.QuantityOnHand ?? 0,
        //                                       MinAvailableStock = p.MinAvailableStock ?? 0,
        //                                       LastUpdate = ir.LastUpdated
        //                                   }
        //                               ).ToList(),

        //                               ProductCount = (
        //                                   from il in Db.InventoryLocations
        //                                   where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
        //                                   join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
        //                                   where ir.isDeleted != true
        //                                   join p in Db.Products on ir.ProductId equals p.ProductId
        //                                   where p.IsDeleted != true
        //                                   select p.Name
        //                               ).Distinct().Count(),

        //                               LowStockCount = (
        //                                   from il in Db.InventoryLocations
        //                                   where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
        //                                   join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
        //                                   where ir.isDeleted != true
        //                                   join p in Db.Products on ir.ProductId equals p.ProductId
        //                                   where p.IsDeleted != true && ir.QuantityOnHand < (p.MinAvailableStock ?? 0)
        //                                   select p.Name
        //                               ).Distinct().Count(),

        //                               LastUpdate = (
        //                                   from il in Db.InventoryLocations
        //                                   where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
        //                                   join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
        //                                   where ir.isDeleted != true
        //                                   select ir.LastUpdated
        //                               ).OrderByDescending(x => x).FirstOrDefault()
        //                           }).ToList();

        //    return warehouseResult;
        //}



        //public List<WarehouseNameLocationProductsListVM> GetWarehouseDetails()
        //{
        //    var warehouseResult = (from warehouse in Db.Warehouses
        //                           where warehouse.isDeleted != true
        //                           select new WarehouseNameLocationProductsListVM
        //                           {
        //                               ID = warehouse.WarehouseID,
        //                               Name = warehouse.Name,
        //                               Location = warehouse.Location,
        //                               Phone = warehouse.ContactPhone,
        //                               TotalSuppliers = Db.Products.Select(p => p.Supplier_Products).Distinct().Count(),
        //                               TotalRevenue = Db.Products.Sum(p => p.UnitPrice * p.CurrentQuantity),

        //                               Productsdetails = (
        //                                   from il in Db.InventoryLocations
        //                                   where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
        //                                   join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
        //                                   where ir.isDeleted != true
        //                                   join p in Db.Products on ir.ProductId equals p.ProductId
        //                                   where p.IsDeleted != true
        //                                   select new ProductDetailsVM
        //                                   {
        //                                       Name = p.Name,
        //                                       Quantity = ir.QuantityOnHand ?? 0,
        //                                       MinAvailableStock = p.MinAvailableStock ?? 0,
        //                                       LastUpdate = ir.LastUpdated
        //                                   }
        //                               ).ToList(),

        //                               // Count of distinct products by name
        //                               ProductCount = (
        //                                   from il in Db.InventoryLocations
        //                                   where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
        //                                   join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
        //                                   where ir.isDeleted != true
        //                                   join p in Db.Products on ir.ProductId equals p.ProductId
        //                                   where p.IsDeleted != true
        //                                   select p.Name
        //                               ).Distinct().Count(),

        //                               // Count of low-stock products
        //                               LowStockCount = (
        //                                   from il in Db.InventoryLocations
        //                                   where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
        //                                   join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
        //                                   where ir.isDeleted != true
        //                                   join p in Db.Products on ir.ProductId equals p.ProductId
        //                                   where p.IsDeleted != true && ir.QuantityOnHand < (p.MinAvailableStock ?? 0)
        //                                   select p.Name
        //                               ).Distinct().Count(),

        //                               // Last update timestamp in warehouse
        //                               LastUpdate = (
        //                                   from il in Db.InventoryLocations
        //                                   where il.WarehouseID == warehouse.WarehouseID && il.isDeleted != true
        //                                   join ir in Db.InventoryRecords on il.LocationID equals ir.LocationId
        //                                   where ir.isDeleted != true
        //                                   select ir.LastUpdated
        //                               ).OrderByDescending(x => x).FirstOrDefault()
        //                           }).ToList();

        //    return warehouseResult;
        //}





        public List<WarehouseNameLocationProductsListVM> GetWarehouseDetails()
        {
            var warehouseResult = (from warehouse in Db.Warehouses
                                   where warehouse.isDeleted != true
                                   select new WarehouseNameLocationProductsListVM
                                   {
                                       ID = warehouse.WarehouseID,
                                       Name = warehouse.Name,
                                       Location = warehouse.Location,
                                       Phone = warehouse.ContactPhone,
                                      
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
                                               Quantity = ir.QuantityOnHand ?? 0,
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

                                       TotalSuppliers = Db.Supplier_Products
                                        .Select(sp => sp.SupplierID)
                                        .Distinct()
                                        .Count(),


                                       TotalRevenue = Db.InventoryRecords
                                        .Where(r => r.Location.WarehouseID == warehouse.WarehouseID && r.Product.UnitPrice != null && r.isDeleted != true)
                                        .Sum(r => (decimal)(r.QuantityOnHand * r.Product.UnitPrice)),

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
                                   Price = p.UnitPrice ?? 0,
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
                TransactionType = moveType,
                FromLocationID = record.LocationId
            };

            Db.InventoryTransactions.Add(transaction);
            return true;
        }
        //    public void EditProduct(ProductDetailsVM model)
        //    {
        //        var product = Db.Products.FirstOrDefault(p => p.ProductId == model.ProductId && p.IsDeleted != true);
        //        if (product != null)
        //        {
        //            product.Name = model.Name;
        //            product.UnitPrice = model.Price;
        //            product.LastUpdated = DateTime.Now;
        //            Db.Entry(product).State = EntityState.Modified;
        //        }
        //    }

        //    public void DeleteProduct(int productId)
        //    {
        //        var product = Db.Products.FirstOrDefault(p => p.ProductId == productId && p.IsDeleted != true);
        //        if (product != null)
        //        {
        //            product.IsDeleted = true;
        //            Db.Entry(product).State = EntityState.Modified;
        //        }
        //    }


        //}


    }
}
