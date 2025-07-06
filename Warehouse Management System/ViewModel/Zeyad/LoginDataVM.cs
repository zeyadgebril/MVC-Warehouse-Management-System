using System.ComponentModel.DataAnnotations;

namespace Warehouse_Management_System.ViewModel.Zeyad
{
    public class LoginDataVM
    {
        [Required(ErrorMessage = "User name is required.")]
        public string UserName { get; set; }
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Password is required.")]
        public string Password { get; set; }
        public bool RememberMe { get; set; } 
        public String ReturnUrl { get; set; } = "?Home/SuspendedAndAdminApproval";
    }
}
