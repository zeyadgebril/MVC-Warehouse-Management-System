using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;
using Warehouse_Management_System.Repository.ProductRepositoryFile;

using Warehouse_Management_System.ViewModel;
using Warehouse_Management_System.ViewModels;

namespace Warehouse_Management_System.Controllers
{
    [Authorize(Roles = "user")]

    public class ProductController : Controller
    {
        private readonly UnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public ProductController(UnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        // Helper to populate supplier dropdown
        private void PopulateSupplierDropDownList(object? selectedSupplier = null)
        {
            try
            {
                var suppliers = _unitOfWork.ProductRepository.GetSuppliers()
                    .Where(s => s.isDeleted != true && s.IsActive == true)
                    .OrderBy(s => s.Name)
                    .ToList();
                ViewBag.SupplierList = new SelectList(suppliers, "SupplierID", "Name", selectedSupplier);
            }
            catch (Exception ex)
            {
                ViewBag.SupplierList = new SelectList(new List<Supplier>(), "SupplierID", "Name");
                TempData["Error"] = $"Could not load suppliers: {ex.Message}";
            }
        }

        // GET: /Product/BySupplier
        // GET: /Product/BySupplier/5 (shows products for supplier ID 5)
        public IActionResult BySupplier(int supplierId)
        {
            try
            {
                // Get the supplier info
                var supplier = _unitOfWork.ProductRepository.GetSuppliers()
                    .FirstOrDefault(s => s.SupplierID == supplierId && s.isDeleted != true);

                if (supplier == null)
                {
                    TempData["Error"] = $"Supplier with ID {supplierId} not found.";
                    return RedirectToAction("Index");
                }

                // Get all products for this supplier
                var products = _unitOfWork.ProductRepository.GetProductsBySupplier(supplierId);
                var productViewModels = _mapper.Map<List<ProductViewModel>>(products);
                // Pass supplier info via ViewBag
                ViewBag.SupplierName = supplier.Name;
                ViewBag.SupplierCompany = supplier.Company;
                ViewBag.SupplierID = supplier.SupplierID;
                ViewBag.SupplierEmail = supplier.Email;
                ViewBag.SupplierPhone = supplier.Phone;

                return View("~/Views/OmarGallo/BySupplier.cshtml", productViewModels);
            }
            catch (Exception ex)
            {
                TempData["Error"] = $"Error loading products for supplier {supplierId}: {ex.Message}";
                return RedirectToAction("Index");
            }
        }

        // Optional: Keep the old method with dropdown if you want both ways
        public IActionResult BySupplierDropdown(int? supplierId)
        {
            PopulateSupplierDropDownList(supplierId);

            if (!supplierId.HasValue)
            {
                ViewBag.SupplierName = null;
                ViewBag.SupplierCompany = null;
                ViewBag.SupplierID = null;
                return View("~/Views/OmarGallo/BySupplierDropdown.cshtml", new List<ProductViewModel>());
            }

            return BySupplier(supplierId.Value);
        } // Reuse the main method

        // Helper to populate category dropdown
        private void PopulateCategoryDropDownList(object? selectedCategory = null)
        {
            try
            {
                var categories = _unitOfWork.ProductRepository.GetCategories()
                    .Where(c => c.isDeleted != true)
                    .OrderBy(c => c.Name)
                    .ToList();
                ViewBag.CategoryList = new SelectList(categories, "CategoryID", "Name", selectedCategory);
            }
            catch (Exception ex)
            {
                ViewBag.CategoryList = new SelectList(new List<Category>(), "CategoryID", "Name");
                TempData["Error"] = $"Could not load categories: {ex.Message}";
            }
        }

        // GET: /Product/Index
        public IActionResult Index()
        {
            try
            {
                var products = _unitOfWork.ProductRepository.getAll();
                var productViewModels = _mapper.Map<List<ProductViewModel>>(products);
                return View("~/Views/OmarGallo/Index.cshtml", productViewModels);
            }
            catch (Exception ex)
            {
                TempData["Error"] = $"Error loading products: {ex.Message}";
                return View("~/Views/OmarGallo/Index.cshtml", new List<ProductViewModel>());
            }
        }

        // GET: /Product/Create
        public IActionResult Create()
        {
            PopulateCategoryDropDownList();
            var model = new ProductViewModel { IsActive = true };
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
            try
            {
                ModelState.Remove("CategoryName");
                ModelState.Remove("ImageFile");
                ModelState.Remove("ProductId");
                ModelState.Remove("CreatedDate");
                ModelState.Remove("LastUpdated");

                if (string.IsNullOrEmpty(model.Name))
                {
                    TempData["Error"] = "Product name is required";
                    PopulateCategoryDropDownList(model.CategoryId);
                    return View("~/Views/OmarGallo/Create.cshtml", model);
                }

                // Handle image upload
                if (model.ImageFile != null && model.ImageFile.Length > 0)
                {
                    string uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Image");
                    if (!Directory.Exists(uploadsFolder))
                        Directory.CreateDirectory(uploadsFolder);

                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(model.ImageFile.FileName);
                    string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        model.ImageFile.CopyTo(fileStream);
                    }
                    model.ImageURL = "/Image/" + uniqueFileName;
                }

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
                TempData["Error"] = $"Error: {errorMessage}";
                PopulateCategoryDropDownList(model.CategoryId);
                return View("~/Views/OmarGallo/Create.cshtml", model);
            }
        }



        // GET: /Product/Edit/5
        public IActionResult Edit(int id)
        {
            try
            {
                var product = _unitOfWork.ProductRepository.getById(id);
                if (product == null)
                {
                    TempData["Error"] = "Product not found.";
                    return NotFound();
                }

                var model = _mapper.Map<ProductViewModel>(product);
                PopulateCategoryDropDownList(model.CategoryId);
                return View("~/Views/OmarGallo/Edit.cshtml", model);
            }
            catch (Exception ex)
            {
                TempData["Error"] = $"Error loading product: {ex.Message}";
                return RedirectToAction("Index");
            }
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
            try
            {
                if (id != model.ProductId)
                {
                    TempData["Error"] = "Product ID mismatch.";
                    return NotFound();
                }

                // Remove the same ModelState issues as in Create
                ModelState.Remove("CategoryName");
                ModelState.Remove("ImageFile");
                ModelState.Remove("CreatedDate");
                ModelState.Remove("LastUpdated");

                if (string.IsNullOrEmpty(model.Name))
                {
                    TempData["Error"] = "Product name is required";
                    PopulateCategoryDropDownList(model.CategoryId);
                    return View("~/Views/OmarGallo/Edit.cshtml", model);
                }

                var existingProduct = _unitOfWork.ProductRepository.getById(id);
                if (existingProduct == null)
                {
                    TempData["Error"] = "Product not found.";
                    return NotFound();
                }

                // Handle image upload (if new image is provided)
                if (model.ImageFile != null && model.ImageFile.Length > 0)
                {
                    string uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Image");
                    if (!Directory.Exists(uploadsFolder))
                        Directory.CreateDirectory(uploadsFolder);

                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(model.ImageFile.FileName);
                    string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        model.ImageFile.CopyTo(fileStream);
                    }
                    model.ImageURL = "/Image/" + uniqueFileName;

                    // Optional: Delete old image file
                    if (!string.IsNullOrEmpty(existingProduct.ImageURL) && existingProduct.ImageURL.StartsWith("/Image/"))
                    {
                        try
                        {
                            string oldImagePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", existingProduct.ImageURL.TrimStart('/').Replace('/', Path.DirectorySeparatorChar));
                            if (System.IO.File.Exists(oldImagePath))
                            {
                                System.IO.File.Delete(oldImagePath);
                            }
                        }
                        catch
                        {
                            // Ignore file deletion errors
                        }
                    }
                }
                else
                {
                    // Keep existing image if no new image is uploaded
                    model.ImageURL = existingProduct.ImageURL;
                }

                // Map changes to existing product
                _mapper.Map(model, existingProduct);
                existingProduct.LastUpdated = DateTime.Now;
                // Don't change CreatedDate - keep original

                _unitOfWork.ProductRepository.Update(existingProduct);
                _unitOfWork.Save();

                TempData["Success"] = "Product updated successfully!";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                var errorMessage = ex.InnerException?.Message ?? ex.Message;
                TempData["Error"] = $"Error updating product: {errorMessage}";
                PopulateCategoryDropDownList(model.CategoryId);
                return View("~/Views/OmarGallo/Edit.cshtml", model);
            }
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

