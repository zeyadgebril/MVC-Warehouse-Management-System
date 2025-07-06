using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.CategoryViewModels;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;

namespace Warehouse_Management_System.Controllers
{
    [Authorize(Roles = "user")]

    public class CategoryController : Controller
    {
        private readonly UnitOfWork _unitOfWork;

        public CategoryController(UnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public IActionResult Index(string? search)
        {
            var categories = string.IsNullOrEmpty(search)
                ? _unitOfWork.CategoryRepository.getAll()
                : _unitOfWork.CategoryRepository.SearchByName(search);

            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                return PartialView("_CategoryTablePartial", categories);
            }

            return View(categories);
        }


        public IActionResult Create()
        {
            return View(new CategoryViewModel());
        }

        [HttpPost]
        public IActionResult Create(CategoryViewModel vm)
        {
            if (!ModelState.IsValid)
            {
                return View(vm);
            }

            var category = new Category
            {
                Name = vm.Name,
                Description = vm.Description
            };

            _unitOfWork.CategoryRepository.add(category);
            _unitOfWork.Save();
            return RedirectToAction("Index");
        }

        public IActionResult Details(int id)
        {
            var category = _unitOfWork.CategoryRepository.getById(id);
            if (category == null)
                return NotFound();

            var products = _unitOfWork.ProductRepository.getAll()
                              .Where(p => p.CategoryId == id)
                              .ToList();

            ViewBag.Products = products;

            return View(category);
        }


        public IActionResult Edit(int id)
        {
            var category = _unitOfWork.CategoryRepository.getById(id);
            if (category == null) return NotFound();

            var vm = new CategoryViewModel
            {
                CategoryID = category.CategoryID,
                Name = category.Name,
                Description = category.Description
            };

            return View(vm);
        }

        [HttpPost]
        public IActionResult Edit(CategoryViewModel vm)
        {
            if (!ModelState.IsValid)
            {
                return View(vm);
            }

            var category = new Category
            {
                CategoryID = vm.CategoryID,
                Name = vm.Name,
                Description = vm.Description
            };

            _unitOfWork.CategoryRepository.Update(category);
            _unitOfWork.Save();
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id)
        {
            var category = _unitOfWork.CategoryRepository.getById(id);
            if (category == null) return NotFound();

            _unitOfWork.CategoryRepository.delete(category);
            _unitOfWork.Save();
            return RedirectToAction("Index");
        }
    }
}
