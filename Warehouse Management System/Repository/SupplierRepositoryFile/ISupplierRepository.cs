using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.SupplierRepositoryFile
{
    public interface ISupplierRepository : IRepository<Supplier>
    {
        //List<Supplier> GetAll();
        List<Supplier> GetAll();
        Supplier getById(int id);
        void add(Supplier entity);
        void Update(Supplier entity);
        void delete (Supplier entity);
    }
}
