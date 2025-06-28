using System.ComponentModel.DataAnnotations;
using Warehouse_Management_System.CustomAttribute;

namespace Warehouse_Management_System.ViewModel.Zeyad
{
    public class RegisterDataVM
    {
        [Required(ErrorMessage = "User name is required.")]
        [StringLength(50, ErrorMessage = "User name must be at most 50 characters.")]
        [UniqueName(ErrorMessage = "This user name is already taken.")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Invalid email format.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is required.")]
        [StringLength(100, MinimumLength = 6, ErrorMessage = "Password must be at least 6 characters.")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Confirm Password is required.")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Passwords do not match.")]
        public string ConfirmPassword { get; set; }

        [StringLength(255, ErrorMessage = "Address must be at most 255 characters.")]
        public string Address { get; set; }
    }
}
