using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;
using Warehouse_Management_System.Repository.SupplierRepositoryFile;

namespace Warehouse_Management_System.Controllers
{
    [Authorize(Roles = "user")]

    public class SupplierController : Controller
    {
  
        private readonly UnitOfWork unitOfWork;
        public SupplierController(UnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }
        [HttpGet]
        public IActionResult Index()
        {
            List<Supplier> SuppliersList = unitOfWork.Suppliers.getAll();
            return View("~/Views/Supplier/Index.cshtml", SuppliersList);
        }
        [HttpGet]
        public IActionResult Details(int id) {
            var supplier = unitOfWork.Suppliers.getById(id);
            if (supplier == null) {
                return BadRequest();
            }
            return View("Details",supplier);
        }
        public IActionResult New()
        {
            return View("New");
        }

        [HttpPost]
        public IActionResult SaveNew(Supplier supplier) {
            if (supplier.Name != null)
            {
                unitOfWork.Suppliers.add(supplier);
                unitOfWork.Save();
                return RedirectToAction("Index");
            }
            return View("New",supplier);
        }
        [HttpGet]
        public IActionResult Edit(int id)
        {
            var supplier = unitOfWork.Suppliers.getById(id);
            if (supplier == null)
            {
                return NotFound();
            }
            return View("Edit", supplier);
        }

        // POST: Handle form submission for updates
        [HttpPost]
        public IActionResult Update(Supplier supplier)
        {
            if (supplier.Name != null)
            {
                try
                {
                    unitOfWork.Suppliers.Update(supplier);
                    unitOfWork.Save();
                    return RedirectToAction("Index");
                }
                catch
                {
                    return NotFound();
                }
            }
            return View("Edit", supplier);
        }
        [HttpGet]
        public IActionResult Delete(int id)
        {
            var data = unitOfWork.Suppliers.getById(id);
            if(data == null)
            {
                return NotFound();
            }
            return View("Delete", data);
        }

        [HttpPost]
       public IActionResult SoftDelete(int id)
        {
            var supplier = unitOfWork.Suppliers.getById(id);
            try
            {
                if (supplier != null)
                {
                    unitOfWork.Suppliers.delete(supplier);
                    unitOfWork.Save();

                }
                return RedirectToAction("Index");
            }
            catch {
                return RedirectToAction("Index");

            }
        }
    }
}
