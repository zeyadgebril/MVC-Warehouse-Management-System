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
            #region test~
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
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(WarehouseNameLocationProductsListVM warehouseVM)
        {
            if (ModelState.IsValid)
            {
                Warehouse warehouse = new Warehouse()
                {
                    Name = warehouseVM.Name,
                    Location = warehouseVM.Location,
                    ContactPhone = warehouseVM.Phone,
                    WarehouseID = warehouseVM.ID,

                };

                Unit.WarehouseRepository.add(warehouse);
                Unit.Save();

                return RedirectToAction("Index",warehouseVM);
            }

           
            return View("Create", warehouseVM); 
        }

        public IActionResult WarehouseDetails(int id )
        {
            Warehouse warehouse= Unit.WarehouseRepository.getById(id);
            if (warehouse == null)
            {
                
                return NotFound(); 
            }
            var allProducts = Unit.WarehouseRepository.GetProductDetailsForWarehouse(id);

          
            WarehouseNameLocationProductsListVM warehouseVM = new WarehouseNameLocationProductsListVM()
            {
                Name =warehouse.Name,
                Location = warehouse.Location,
                Phone = warehouse.ContactPhone,
                ID = warehouse.WarehouseID,
                LastUpdate = DateTime.Now, // or get from inventory
                Productsdetails = allProducts

            };
            return View("WarehouseDetails", warehouseVM);
        }

        public IActionResult EditWarhouse(WarehouseNameLocationProductsListVM warehouseVM, int id)
        {
            if (ModelState.IsValid)
            {
                Warehouse warehouse = new Warehouse
                {
                    WarehouseID = id,
                    Name = warehouseVM.Name,
                    Location = warehouseVM.Location,
                    ContactPhone = warehouseVM.Phone,
                };
                Unit.WarehouseRepository.Update(warehouse, id);
                Unit.Save();
                return  RedirectToAction("WarehouseDetails", new { id = warehouse.WarehouseID });
            }
            else
            {
                return View("WarehouseDetails", warehouseVM);

            }
        }
        [HttpPost]
        public IActionResult DeleteWarehouse(int id)
        {
            Unit.WarehouseRepository.delete(id);
            Unit.Save();
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult MoveQuantity(ProductMoveVM model)
        {
            if (ModelState.IsValid)
            {
                bool success = Unit.WarehouseRepository.MoveProductStock(model);

                if (!success)
                {
                    TempData["Error"] = "Stock movement failed.";
                }

                Unit.Save();
                return RedirectToAction("WarehouseDetails", new { id = model.WarehouseId });
            }

            return RedirectToAction("Index");
        }
        //[HttpPost]
        //public IActionResult EditProduct(ProductDetailsVM model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        Unit.WarehouseRepository.EditProduct(model);
        //        Unit.Save();
        //        return RedirectToAction("WarehouseDetails", new { id = model.ProductId });
        //    }
        //    return RedirectToAction("Index");
        //}

        //[HttpPost]
        //public IActionResult DeleteProduct(int productId, int warehouseId)
        //{
        //    Unit.WarehouseRepository.DeleteProduct(productId);
        //    Unit.Save();
        //    return RedirectToAction("WarehouseDetails", new { id = warehouseId });
        //}

    }
}
