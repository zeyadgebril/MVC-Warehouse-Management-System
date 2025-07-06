using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.Blazor;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;

namespace Warehouse_Management_System.Controllers
{
    public class UserController : Controller
    {
        private readonly IUnitOfWork unitOfWork;

        //ISupplierRepository SupplierRepository;
        public UserController(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Edit(User user) {
            if (user.UserName != null)
            {
                try
                {
                    unitOfWork.Users.Update(user);
                    unitOfWork.Save();
                    return RedirectToAction("Index");
                }
                catch
                {
                    return NotFound();
                }
            }
            return View("Edit", user);
        }
    }
}
