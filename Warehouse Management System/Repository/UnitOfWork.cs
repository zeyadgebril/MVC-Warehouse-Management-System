using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository.ProductRepositoryFile;
using Warehouse_Management_System.Repository.SupplierRepositoryFile;

namespace Warehouse_Management_System.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly MvcDbContextContext context;
        private ISupplierRepository _suppliers;

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

        public ISupplierRepository SupplierRepository => throw new NotImplementedException();

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
