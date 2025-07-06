using Warehouse_Management_System.Models;
namespace Warehouse_Management_System.Repository
{
    public interface IProductRepository:IRepository<Product> 
    {
        public IQueryable<Category> GetCategories();
        public IQueryable<Supplier> GetSuppliers();

        public List<Product> GetProductsBySupplier(int supplierId);

    }
}
