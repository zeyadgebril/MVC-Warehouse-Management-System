using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;
using Warehouse_Management_System.ViewModel.Mohamed_H;

namespace Warehouse_Management_System.Controllers
{
    public class WarehouseController : Controller
    {
        public UnitOfWork Unit { get; }
        public WarehouseController(UnitOfWork unit , IMapper mapper  )
        {
            Unit = unit;
        }



        public IActionResult Index()
        {
            #region test
            //List<Warehouse> Warehouselist = Unit.WarehouseRepository.getAll().Where(p=> p.isDeleted != true).ToList();
            //List< WarehouseNameLocationProductsListVM > whoustVmList = new List<WarehouseNameLocationProductsListVM>();
            //foreach (var warehouse in Warehouselist)
            //{

            //    WarehouseNameLocationProductsListVM whoustVm = new WarehouseNameLocationProductsListVM
            //    {
            //        Name = warehouse.Name,
            //        Location = warehouse.Location,
            //        Products = warehouse.InventoryLocations.Select(il => il.).ToList()
            //    };
            //    whoustVmList.Add(whoustVm);
            //}
            #endregion

            List<WarehouseNameLocationProductsListVM> Warehouselist = Unit.WarehouseRepository.GetWarehouseDetails();
        
            return View("Index",Warehouselist);
        }
    }
}
