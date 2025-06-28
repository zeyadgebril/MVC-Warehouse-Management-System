using Microsoft.AspNetCore.Identity;
using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using Warehouse_Management_System.Models;
using Warehouse_Management_System.Repository;
using Microsoft.AspNetCore.Authorization;
using Warehouse_Management_System.ViewModel.Zeyad;

namespace Warehouse_Management_System.Controllers
{
    public class AccountController : Controller
    {
        private readonly UnitOfWork unitOfWork;
        private readonly UserManager<ApplicationUser> UserManager;
        private readonly SignInManager<ApplicationUser> SignInManager;

        public AccountController(UnitOfWork unitOfWork,UserManager<ApplicationUser> userManager , SignInManager<ApplicationUser> signInManager)
        {
            this.unitOfWork = unitOfWork;
            this.UserManager = userManager;
            this.SignInManager = signInManager;
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
                ApplicationUser usre = await UserManager.FindByNameAsync(loginData.UserName);
                if (usre != null)
                {
                    bool found = await UserManager.CheckPasswordAsync(usre, loginData.Password);
                    if (found)
                    {
                        await SignInManager.SignInAsync(usre, loginData.RememberMe);
                        var data = unitOfWork.userLogsRepository.UpdateUserLogs(usre, "Login");
                        if (data.IsSuspended == true)
                        {
                            return RedirectToAction("SuspendedAndAdminApproval", "Home");
                        }
                        // updated to dashpiard ......
                        return RedirectToAction("Privacy", "Home");
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

                };
                IdentityResult created = await UserManager.CreateAsync(user, registerData.Password);
                if (created.Succeeded)
                {
                    //await UserManager.AddToRoleAsync(user, "instructor");
                    unitOfWork.userLogsRepository.UpdateUserLogs(user, "Register");
                    await SignInManager.SignInAsync(user, false);
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
            var properties = SignInManager.ConfigureExternalAuthenticationProperties(provider, redirectUrl);
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

            var result = await SignInManager.ExternalLoginSignInAsync(info.LoginProvider, info.ProviderKey, isPersistent: false, bypassTwoFactor: true);

            if (result.Succeeded)
            {
                var user = await UserManager.FindByLoginAsync(info.LoginProvider, info.ProviderKey);
                if (user != null)
                {
                    unitOfWork.userLogsRepository.UpdateUserLogs(user,"Gooogle Account");
                    await UserManager.UpdateAsync(user);
                }

                return LocalRedirect(returnUrl ?? "/");
            }
            else
            {
                var email = info.Principal.FindFirstValue(ClaimTypes.Email);

                if (email != null)
                {
                    var user = new ApplicationUser
                    {
                        UserName = email,
                        Email = email,
                        Address = "From Extirnal login",
                        FullName = email.Split("@")[0],
                        LastLogin = DateTime.UtcNow 
                    };

                    var createResult = await UserManager.CreateAsync(user);
                    if (createResult.Succeeded)
                    {
                        createResult = await UserManager.AddLoginAsync(user, info);

                        if (createResult.Succeeded)
                        {
                            await SignInManager.SignInAsync(user, isPersistent: false);
                            return LocalRedirect(returnUrl ?? "/");
                        }
                    }
                }

                return RedirectToAction(nameof(Login));
            }
        }

    }
}
