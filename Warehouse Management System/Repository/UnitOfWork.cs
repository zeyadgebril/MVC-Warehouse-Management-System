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

        public IProductRepository ProductRepository
        {
            get
            {
                if (_productRepository == null)
                    _productRepository = new ProductRepository(db);
                return _productRepository;
            }
        }
        public void Save() {
        db.SaveChanges();
        }
    }
}
