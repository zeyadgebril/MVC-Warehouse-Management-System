using Warehouse_Management_System.Repository.SupplierRepositoryFile;
using Warehouse_Management_System.Repository.UserRepositoryFile;

namespace Warehouse_Management_System.Repository
{
    public interface IUnitOfWork : IDisposable
    {
        ISupplierRepository Suppliers { get; }
        IUserRepository Users { get; }

        int Save();
        Task<int> SaveAsync();
    }
}
