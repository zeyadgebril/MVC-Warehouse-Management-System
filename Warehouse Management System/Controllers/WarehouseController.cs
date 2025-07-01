using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Repository;

namespace Warehouse_Management_System.Controllers
{
    public class WarehouseController : Controller
    {
        public UnitOfWork Unit { get; }
        public WarehouseController(UnitOfWork unit)
        {
            Unit = unit;
        }

        

        public IActionResult Index()
        {
            // again

            //hello
            return View();
        }
    }
}
