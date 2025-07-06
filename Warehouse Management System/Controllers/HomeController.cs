using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult SuspendedAndAdminApproval()
        {
            return View();
        }
        public IActionResult Error()
        {
            throw new NotImplementedException();
        }
        public IActionResult UserDashpord()
        {
            return View();
        }


    }
}
