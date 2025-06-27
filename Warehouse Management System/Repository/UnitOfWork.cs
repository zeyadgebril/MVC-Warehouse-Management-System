using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository.ProductRepositoryFile;

namespace Warehouse_Management_System.Repository
{
    public class UnitOfWork
    {
        private readonly dbContext db;
        private IProductRepository _productRepository;

        public UnitOfWork(dbContext db)
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

	}
}
