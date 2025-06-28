using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository.ProductRepositoryFile;
using Warehouse_Management_System.Repository.UserLogsRepositoryFile;

namespace Warehouse_Management_System.Repository
{
    public class UnitOfWork
    {
        private readonly dbContext db;
        private IProductRepository _productRepository;
        private IUserLogsRepository _userLogsRepository;

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
        public IUserLogsRepository userLogsRepository
        {
            get
            {
                if (_userLogsRepository == null)
                    _userLogsRepository = new UserLogsRepository(db);
                return _userLogsRepository;
            }
        }

    }
}
