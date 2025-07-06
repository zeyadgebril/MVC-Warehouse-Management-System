using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.ProductRepositoryFile
{
    public class ProductRepository : IProductRepository
    {
        private readonly dbContext db;
        private DbContext db1;

        public ProductRepository(dbContext db)
        {
            this.db = db;
        }

        public ProductRepository(DbContext db1)
        {
            this.db1 = db1;
        }

        public void add(Product entity)
        {
            db.Products.Add(entity);
        }
        public void delete(Product entity)
        {
            var data = getById(entity.ProductId);
            if (data != null)
            {
                data.IsDeleted = true;
                Update(data);
            }
        }
        public List<Product> getAll()
        {
           return db.Set<Product>().Where(e=>e.IsDeleted!=true).ToList();
        }
        public Product getById(int id)
        {
            return db.Set<Product>()
                  .Where(e => e.IsDeleted != true)
                  .FirstOrDefault(e=>e.ProductId==id);
        }
        public void Update(Product entity)
        {
            db.Entry(entity).State=Microsoft.EntityFrameworkCore.EntityState.Modified;
        }
        public IQueryable<Category> GetCategories() => db.Categories;
        public IQueryable<Supplier> GetSuppliers() => db.Suppliers;

        public List<Product> GetProductsBySupplier(int supplierId)
        {
            return db.Supplier_Products
                .Where(sp => sp.SupplierID == supplierId && sp.isDeleted != true)
                .Include(sp => sp.Product)
                .ThenInclude(p => p.Category)
                .Select(sp => sp.Product)
                .Where(p => p.IsDeleted != true)
                .ToList();
        }

    }
}
