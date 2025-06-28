using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository
{
    public class WarehouseRepository : Repository<Warehouse>
    {
        public WarehouseRepository(MvcDbContextContext db) : base(db)
        {
            
        }
    }
}
