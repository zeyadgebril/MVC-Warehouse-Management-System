using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository.ProductRepositoryFile;

namespace Warehouse_Management_System.Repository
{
    public class UnitOfWork
    {
        private readonly MvcDbContext db;
        private IProductRepository _productRepository;

        public UnitOfWork(MvcDbContext db)
        {
            this.db = db;
        }

        public IQueryable<Category> GetCategories() => db.Categories;

        public IQueryable<Supplier> GetSuppliers() => db.Suppliers;

        // Add this method to get products by supplier
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

        public IProductRepository ProductRepository
        {
            get
            {
                if (_productRepository == null)
                    _productRepository = new ProductRepository(db);
                return _productRepository;
            }
        }

        public void Save()
        {
            try
            {
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception($"Error saving changes to database: {ex.Message}", ex);
            }
        }
    }
}

