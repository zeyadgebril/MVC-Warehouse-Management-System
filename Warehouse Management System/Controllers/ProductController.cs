using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;
using Warehouse_Management_System.ViewModels;

namespace Warehouse_Management_System.Controllers
{
    public class ProductController : Controller
    {
        private readonly UnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public ProductController(UnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        // GET: /Product/Index
        public IActionResult Index()
        {
            var products = _unitOfWork.ProductRepository.getAll();
            var productViewModels = _mapper.Map<List<ProductViewModel>>(products);

            return View("~/Views/OmarGallo/Index.cshtml", productViewModels);
        }

        // GET: /Product/Create
        public IActionResult Create()
        {
            var model = new ProductViewModel
            {
                IsActive = true
            };
            return View("~/Views/OmarGallo/Create.cshtml", model);
        }

        // POST: /Product/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(ProductViewModel model)
        {
            return SaveNew(model);
        }

        // POST: /Product/SaveNew
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SaveNew(ProductViewModel model)
        {
            ModelState.Remove("CategoryName");

            if (ModelState.IsValid)
            {
                try
                {
                    var product = _mapper.Map<Product>(model);

                    product.CreatedDate = DateTime.Now;
                    product.LastUpdated = DateTime.Now;
                    product.IsDeleted = false;
                    product.IsActive = model.IsActive ?? true;

                    _unitOfWork.ProductRepository.add(product);
                    _unitOfWork.Save();
                    TempData["Success"] = "Product created successfully!";
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    var errorMessage = ex.InnerException?.Message ?? ex.Message;
                    ModelState.AddModelError("", $"Unable to save changes: {errorMessage}");
                    TempData["Error"] = $"Error: {errorMessage}";
                }
            }
            else
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage);
                TempData["Error"] = $"Validation failed: {string.Join(", ", errors)}";
            }

            return View("~/Views/OmarGallo/Create.cshtml", model);
        }

        // GET: /Product/Edit/5
        public IActionResult Edit(int id)
        {
            var product = _unitOfWork.ProductRepository.getById(id);
            if (product == null) return NotFound();

            var model = _mapper.Map<ProductViewModel>(product);

            return View("~/Views/OmarGallo/Edit.cshtml", model);
        }

        // POST: /Product/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, ProductViewModel model)
        {
            return SaveEdit(id, model);
        }

        // POST: /Product/SaveEdit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SaveEdit(int id, ProductViewModel model)
        {
            if (id != model.ProductId) return NotFound();

            ModelState.Remove("CategoryName");

            if (ModelState.IsValid)
            {
                try
                {
                    var existingProduct = _unitOfWork.ProductRepository.getById(id);
                    if (existingProduct == null) return NotFound();

                    _mapper.Map(model, existingProduct);
                    existingProduct.LastUpdated = DateTime.Now;

                    _unitOfWork.ProductRepository.Update(existingProduct);
                    _unitOfWork.Save();
                    TempData["Success"] = "Product updated successfully!";
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    var errorMessage = ex.InnerException?.Message ?? ex.Message;
                    ModelState.AddModelError("", $"Unable to save changes: {errorMessage}");
                    TempData["Error"] = $"Error: {errorMessage}";
                }
            }
            else
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage);
                TempData["Error"] = $"Validation failed: {string.Join(", ", errors)}";
            }

            return View("~/Views/OmarGallo/Edit.cshtml", model);
        }

        // GET: /Product/Delete/5
        public IActionResult Delete(int id)
        {
            var product = _unitOfWork.ProductRepository.getById(id);
            if (product == null) return NotFound();

            var model = _mapper.Map<ProductViewModel>(product);

            return View("~/Views/OmarGallo/Delete.cshtml", model);
        }

        // POST: /Product/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            try
            {
                var product = _unitOfWork.ProductRepository.getById(id);
                if (product == null) return NotFound();

                _unitOfWork.ProductRepository.delete(product);
                _unitOfWork.Save();
                TempData["Success"] = "Product deleted successfully!";
            }
            catch (Exception ex)
            {
                var errorMessage = ex.InnerException?.Message ?? ex.Message;
                TempData["Error"] = $"Error deleting product: {errorMessage}";
            }

            return RedirectToAction("Index");
        }

        // GET: /Product/Details/5
        public IActionResult Details(int id)
        {
            var product = _unitOfWork.ProductRepository.getById(id);
            if (product == null) return NotFound();

            var model = _mapper.Map<ProductViewModel>(product);

            return View("~/Views/OmarGallo/Details.cshtml", model);
        }
    }
}
