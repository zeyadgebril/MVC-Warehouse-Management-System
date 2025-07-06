using Microsoft.AspNetCore.Identity;
using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;
using Microsoft.AspNetCore.Authorization;
using Warehouse_Management_System.ViewModel.Zeyad;
using System.Threading.Tasks;
using System.Security.Principal;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;

namespace Warehouse_Management_System.Controllers
{
    [AllowAnonymous]
    public class AccountController : Controller
    {
        private readonly UnitOfWork unitOfWork;
        private readonly UserManager<ApplicationUser> UserManager;
        private readonly SignInManager<ApplicationUser> SignInManager;
        private readonly RoleManager<IdentityRole> roleManager;

        public AccountController(UnitOfWork unitOfWork,UserManager<ApplicationUser> userManager , 
                                 SignInManager<ApplicationUser> signInManager,RoleManager<IdentityRole> roleManager)
        {
            this.unitOfWork = unitOfWork;
            this.UserManager = userManager;
            this.SignInManager = signInManager;
            this.roleManager = roleManager;
        }
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

     
        [HttpPost]
        public async Task<IActionResult> Login(LoginDataVM loginData)
        {
            if (ModelState.IsValid)
            {
                ApplicationUser user = await UserManager.FindByNameAsync(loginData.UserName);
                if (user != null)
                {
                    bool found = await UserManager.CheckPasswordAsync(user, loginData.Password);
                    if (found)
                    {
                        await SignInManager.SignInAsync(user, loginData.RememberMe);
                        if(User.IsInRole("admin"))
                        {
                           
                            HttpContext.Session.SetInt32("Num1122", unitOfWork.AccountRepository.GetNumberOfSuspended());

                        }
                        var data = unitOfWork.userLogsRepository.UpdateUserLogs(user, "Login");
                        unitOfWork.AccountRepository.MakeHimLookOnlineForAdmin(user.Id);
                        if (data.IsSuspended == true)
                        {
                            return RedirectToAction("SuspendedAndAdminApproval", "Home");
                        }
                        // updated to dashpiard ......
                        return RedirectToAction("Index", "Admin");
                    }
                }
                ModelState.AddModelError("", "Invalid Account");
            }
            return View(loginData);
        }
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterDataVM registerData)
        {
            if (ModelState.IsValid)
            {
                ApplicationUser user = new ApplicationUser()
                {
                    UserName = registerData.UserName,
                    Email = registerData.Email,
                    PasswordHash = registerData.Password,
                    Address = registerData.Address,
                    FullName = registerData.Email.Split("@")[0],
                    IsSuspended = true,
                    PhoneNumber = registerData.PhoneNumber,

                };
                IdentityResult created = await UserManager.CreateAsync(user, registerData.Password);
                if (created.Succeeded)
                {
                    await UserManager.AddToRoleAsync(user, "user");
                    unitOfWork.userLogsRepository.UpdateUserLogs(user, "Register");
                    await SignInManager.SignInAsync(user, false);
                    unitOfWork.AccountRepository.MakeHimLookOnlineForAdmin(user.Id);
                    return RedirectToAction("SuspendedAndAdminApproval","Home");
                }
                foreach (var item in created.Errors)
                {
                    ModelState.AddModelError("", item.Description);
                }

            }
            return View("Register", registerData);
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public IActionResult ExternalLogin(string provider, string returnUrl = null)
        {
            var redirectUrl = Url.Action("ExternalLoginCallback", "Account", new { ReturnUrl = returnUrl });
            var properties = SignInManager.ConfigureExternalAuthenticationProperties(
                provider,
                redirectUrl);

            // Force fresh login every time
            properties.Items["prompt"] = "select_account";
            return Challenge(properties, provider);
        }
        public async Task<IActionResult> ExternalLoginCallback(string returnUrl = null, string remoteError = null)
        {
            if (remoteError != null)
            {
                ModelState.AddModelError(string.Empty, $"Error from external provider: {remoteError}");
                return RedirectToAction(nameof(Login));
            }

            var info = await SignInManager.GetExternalLoginInfoAsync();
            if (info == null)
            {
                return RedirectToAction(nameof(Login));
            }

            var result = await SignInManager.ExternalLoginSignInAsync(info.LoginProvider, info.ProviderKey, isPersistent: true, bypassTwoFactor: true);

            if (result.Succeeded)
            {
                var user = await UserManager.FindByLoginAsync(info.LoginProvider, info.ProviderKey);
                if (user != null)
                {
                    unitOfWork.AccountRepository.MakeHimLookOnlineForAdmin(user.Id);
                    unitOfWork.userLogsRepository.UpdateUserLogs(user, "Google Account");
                    await UserManager.UpdateAsync(user);
                    if (user.IsSuspended)
                    {
                        await SignInManager.SignOutAsync();
                        return RedirectToAction("SuspendedAndAdminApproval", "Home");
                    }
                }
                return LocalRedirect(returnUrl ?? "/");
            }
            else
            {
                var email = info.Principal.FindFirstValue(ClaimTypes.Email);

                if (email != null)
                {
                    var user = await UserManager.FindByEmailAsync(email);
                    if (user == null)
                    {
                        user = new ApplicationUser
                        {
                            UserName = email,
                            Email = email,
                            Address = "From External login",
                            FullName = email.Split("@")[0],
                            LastLogin = DateTime.UtcNow,
                            IsSuspended = true,
                        };

                        var createResult = await UserManager.CreateAsync(user);
                        if (createResult.Succeeded)
                        {
                            await UserManager.AddToRoleAsync(user, "user");
                            createResult = await UserManager.AddLoginAsync(user, info);
                            unitOfWork.AccountRepository.MakeHimLookOnlineForAdmin(user.Id);
                        }
                    }

                    if (user != null)
                    {
                        if (User.IsInRole("admin"))
                        {
                            HttpContext.Session.SetInt32("Num1122", unitOfWork.AccountRepository.GetNumberOfSuspended());
                        }

                        // Clear any existing external cookie
                        await HttpContext.SignOutAsync(IdentityConstants.ExternalScheme);
                        unitOfWork.AccountRepository.MakeHimLookOnlineForAdmin(user.Id);

                        // Sign in the user
                        await SignInManager.SignInAsync(user, isPersistent: false);
                        unitOfWork.userLogsRepository.UpdateUserLogs(user, "Google Account");

                        // Check suspension status
                        if (user.IsSuspended)
                        {
                            return RedirectToAction("SuspendedAndAdminApproval", "Home");
                        }

                        return LocalRedirect(returnUrl ?? "/");   ///////////////////////////////////////////
                    }
                }
                return RedirectToAction(nameof(Login));
            }
        }
        public async Task<IActionResult> SignOut()
        {
            await HttpContext.SignOutAsync(IdentityConstants.ApplicationScheme);
            await HttpContext.SignOutAsync(IdentityConstants.ExternalScheme);
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            unitOfWork.AccountRepository.MakeHimLookOfflineForAdmin(userId);

            return RedirectToAction("Index", "Home");
        }


        [HttpGet]
        public IActionResult CreateRole()
        {
            return View();
        }
        [HttpPost]
        [Authorize(Roles ="admin")]
        public async Task<IActionResult> CreateRole(RoleDataVM roleDataVM)
        {
            if (ModelState.IsValid)
            {
                if (User.Identity.IsAuthenticated)
                {
                    IdentityRole identityRole = new IdentityRole()
                    {
                        Name = roleDataVM.RoleName
                    };
                    IdentityResult result= await roleManager.CreateAsync(identityRole);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Index", "Admin");
                    }
                    foreach(var i in result.Errors)
                    {
                    ModelState.AddModelError("", i.Description);
                    }
                }
            }
            return View();
        }
    }
}
