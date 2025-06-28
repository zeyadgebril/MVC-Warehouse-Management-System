using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Repository;

namespace Warehouse_Management_System.Controllers
{
    public class AdminController : Controller
    {
        private readonly UnitOfWork unitOfWork;

        public AdminController(UnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public IActionResult ApproveUser()
        {
            return View(unitOfWork.AdminRepository.ApproveUser());
        }
        [HttpGet]
        public IActionResult ApproveUserVirify(string id,string request)
        {

            return View();
        }
    }
}
