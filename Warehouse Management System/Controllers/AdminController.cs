using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;
using Warehouse_Management_System.ViewModel.Zeyad;

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

            if (User.IsInRole("admin"))
            {
                HttpContext.Session.SetInt32("Num1122", unitOfWork.AccountRepository.GetNumberOfSuspended());
            }
            return View();
        }
        [HttpGet]
        [Authorize(Roles = "admin")]

        public IActionResult ApproveUser()
        {
            return View(unitOfWork.AdminRepository.ApproveUser());
        }
        [HttpGet]
        [Authorize(Roles = "admin")]

        public IActionResult ApproveUserVirify(string id, string request)
        {
            if (id != null || request != null)
            {
                unitOfWork.AdminRepository.SetRequest(id, request);
                HttpContext.Session.SetInt32("Num1122", unitOfWork.AccountRepository.GetNumberOfSuspended());

            }

            return View("Index", "Admin");
        }

        [HttpGet]
        [Authorize(Roles = "admin")]

        public IActionResult userMangment(int page = 1)
        {
            int pageSize = 4;
            var pageData=  unitOfWork.AdminRepository.GetUserManegment(page, pageSize);
            return View(pageData);
        }
        [HttpGet]
        [Authorize(Roles = "admin")]

        public IActionResult Search(string searchTerm)
        {
            var users = unitOfWork.AdminRepository.GetUsersBySeach(searchTerm ?? "");
            return PartialView("_UserTableRows",users );
        }
        [HttpGet]
        [Authorize(Roles = "admin")]

        public IActionResult SelectUser(string selectedValue)
        {
            return PartialView("_UserTableRows",unitOfWork.AdminRepository.GetSelectedUser(selectedValue));
        }

        [HttpPost]
        [Authorize(Roles = "admin")]

        public IActionResult SuupendOrApprove(string UserId, string UserAction  )
        {
            if (UserAction == "View")
            {
                ////////In case youIneed to redirect in ajax///////////
                //var url = Url.Action("Index", "Admin", new { userId = UserId });
                //return Ok(new { redirectUrl = url });
                var data = unitOfWork.AdminRepository.GetUserBrID(UserId);
                return Json(data);


            }
            var Valid = unitOfWork.AdminRepository.SetRequest(UserId, UserAction);
                if (Valid)
                    return Ok();

                return NotFound();
            

        }


        [HttpGet]
        [Authorize(Roles = "admin")]

        public IActionResult GetDashboardData()
        {
            var data = unitOfWork.AdminRepository.GetDashpoardData();
            return Json(data);
        }


    }
}