using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;
using Warehouse_Management_System.ViewModel.Mohamed_H;

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
            List<Warehouse> Warehouselist = Unit.WarehouseRepository.getAll().Where(p=> p.isDeleted != true).ToList();
            return View("Index",Warehouselist);
        }
    }
}
