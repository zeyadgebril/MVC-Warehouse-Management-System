using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Repository;

namespace Warehouse_Management_System.Controllers
{
    [Authorize(Roles = "user")]

    public class DashboardController : Controller
    {
        UnitOfWork Unit;

        public DashboardController(UnitOfWork unit)
        {
            Unit = unit;
        }
        public IActionResult Index()
        {
            var dashboardVM = Unit.DashboardRepository.GetDashboardData();
            return View(dashboardVM);
        }
    }
}
