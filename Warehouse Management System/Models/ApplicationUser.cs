using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace Warehouse_Management_System.Models
{
    public class ApplicationUser:IdentityUser
    {
        [Required]
        [StringLength(100)]
        public string FullName { get; set; }

        [Required]
        [StringLength(200)]
        public string Address { get; set; }

        public bool IsActive { get; set; } = true;

        [DataType(DataType.DateTime)]
        public DateTime LastLogin { get; set; } = DateTime.UtcNow;

        [DataType(DataType.DateTime)]
        public DateTime CreatedDate { get; set; } = DateTime.UtcNow;

        public bool IsDeleted { get; set; } = false;

        public bool IsSuspended { get; set; } = false;
    }
}
