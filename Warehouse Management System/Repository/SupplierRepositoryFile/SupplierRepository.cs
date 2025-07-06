using Microsoft.EntityFrameworkCore;
using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.SupplierRepositoryFile
{
    public class SupplierRepository : ISupplierRepository
    {
        private readonly dbContext mvcContext;
        public SupplierRepository(dbContext context)
        {
            mvcContext = context;
        }

        public void add(Supplier supplier)
        {
           mvcContext.Suppliers.Add(supplier);
        }

        public void delete(Supplier entity)
        {
            var data = getById(entity.SupplierID);
            if (data != null) {
                data.isDeleted = true;
                mvcContext.Entry(data).State = EntityState.Modified;
            }

        }

        public List<Supplier> getAll()
        {
           
            return mvcContext.Suppliers.Where(s => s.isDeleted == false || s.isDeleted == null).ToList();
        }

        public Supplier getById(int id)
        {
            return mvcContext.Suppliers.Where(s => s.SupplierID == id && (s.isDeleted == false || s.isDeleted == null)).FirstOrDefault(e => e.SupplierID==id);
        }

        public void Update(Supplier entity)
        {
            Supplier supDB = getById(entity.SupplierID);
            if (supDB == null)
            {
                throw new InvalidOperationException($"Supplier with ID {entity.SupplierID} not found");
            }
            supDB.Name=entity.Name;
            supDB.Address=entity.Address;
            supDB.Company = entity.Company;

        }

        public List<Supplier> GetAll()
        {
            throw new NotImplementedException();
        }
    }
}
