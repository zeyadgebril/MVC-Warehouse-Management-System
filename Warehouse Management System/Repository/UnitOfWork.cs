using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository
{
    public class UnitOfWork
    {
        public MvcDbContextContext Db { get; }
        WarehouseRepository warehouseRepository;
        DashboardRepository dashboardRepository;
        public UnitOfWork(MvcDbContextContext db)
        {
            Db = db;
        }

        public WarehouseRepository WarehouseRepository { 
            
            get
            {
                if (warehouseRepository == null)
                    warehouseRepository = new WarehouseRepository(Db);
                return warehouseRepository;
            }
        
        }
        public DashboardRepository DashboardRepository
        {

            get
            {
                if (dashboardRepository == null)
                    dashboardRepository = new DashboardRepository(Db);
                return dashboardRepository;
            }

        }
        public void Save()
        {
            Db.SaveChanges();
        }
    }
}
