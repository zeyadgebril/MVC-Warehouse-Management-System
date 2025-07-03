using Warehouse_Management_System.Repository.SupplierRepositoryFile;

namespace Warehouse_Management_System.Repository
{
    public interface IUnitOfWork : IDisposable
    {
        ISupplierRepository Suppliers { get; }

        int Save();
        Task<int> SaveAsync();
    }
}
