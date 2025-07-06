using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository.AccountRepositoryFile;
using Warehouse_Management_System.Repository.AdminRepositoryFile;
using Warehouse_Management_System.Repository.CategoryRepositoryFile;
using Warehouse_Management_System.Repository.ProductRepositoryFile;
using Warehouse_Management_System.Repository.SupplierRepositoryFile;
using Warehouse_Management_System.Repository.UserLogsRepositoryFile;
using Warehouse_Management_System.Repository.UserRepositoryFile;

namespace Warehouse_Management_System.Repository
{
    public class UnitOfWork
    {
        private readonly dbContext db;
        private readonly UserManager<ApplicationUser> userManager;
        private IProductRepository _productRepository;
        private IUserLogsRepository _userLogsRepository;
        private IAdminRepository _AdminRepository;
        public IAccountRepository _AccountRepository;
        private ICategoryRepository _categoryRepository;
        private WarehouseRepository warehouseRepository;
        private DashboardRepository dashboardRepository;

        private ISupplierRepository _suppliers;
        private IUserRepository _users;




        public UnitOfWork(dbContext db, UserManager<ApplicationUser> userManager)
        {
            this.db = db;
            this.userManager = userManager;
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
        public IAdminRepository AdminRepository
        {
            get
            {
                if (_AdminRepository == null)
                    _AdminRepository = new AdminRepository(db, userManager);
                return _AdminRepository;
            }
        }
        public IAccountRepository AccountRepository
        {
            get
            {
                if (_AccountRepository == null)
                    _AccountRepository = new AccountRepository(db);
                return _AccountRepository;
            }
        }


        public ICategoryRepository CategoryRepository
        {
            get
            {
                if (_categoryRepository == null)
                    _categoryRepository = new CategoryRepository(db);
                return _categoryRepository;
            }
        }

        public WarehouseRepository WarehouseRepository
        {

            get
            {
                if (warehouseRepository == null)
                    warehouseRepository = new WarehouseRepository(db);
                return warehouseRepository;
            }

        }
        public DashboardRepository DashboardRepository
        {

            get
            {
                if (dashboardRepository == null)
                    dashboardRepository = new DashboardRepository(db);
                return dashboardRepository;
            }

        }

        public ISupplierRepository Suppliers
        {
            get
            {
                if (_suppliers == null)
                    _suppliers = new SupplierRepository(db);
                return _suppliers;
            }
        }
        public IUserRepository Users
        {
            get
            {
                if (_users == null)
                    _users = new UserRepository(db);
                return _users;
            }
        }

        public void Dispose()
        {
            db.Dispose();
        }
        public void Save()
        {
            db.SaveChanges();
        }

    }
}
