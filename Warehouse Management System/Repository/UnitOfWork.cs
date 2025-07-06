using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository.ProductRepositoryFile;
using Warehouse_Management_System.Repository.SupplierRepositoryFile;
using Warehouse_Management_System.Repository.UserRepositoryFile;

namespace Warehouse_Management_System.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly MvcDbContextContext context;
        private ISupplierRepository _suppliers;
        private IUserRepository _users;

        public UnitOfWork(MvcDbContextContext context)
        {
            this.context = context;
        }

        public ISupplierRepository Suppliers
        {
            get
            {
                if (_suppliers == null)
                    _suppliers = new SupplierRepository(context);
                return _suppliers;
            }
        }
        public IUserRepository Users
        {
            get
            {
                if (_users == null)
                    _users = new UserRepository(context);
                return _users;
            }
        }

        public ISupplierRepository SupplierRepository => throw new NotImplementedException();

        public IUserRepository UserRepository => throw new NotImplementedException();

        // Add other repositories as needed
        // public ICustomerRepository Customers => _customers ??= new CustomerRepository(context);

        public int Save()
        {
            return context.SaveChanges();
        }

        public async Task<int> SaveAsync()
        {
            return await context.SaveChangesAsync();
        }

        public void Dispose()
        {
            context.Dispose();
        }
    }
}
