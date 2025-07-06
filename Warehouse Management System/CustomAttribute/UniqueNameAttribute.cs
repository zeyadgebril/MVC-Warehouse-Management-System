using System.ComponentModel.DataAnnotations;
using Microsoft.Extensions.DependencyInjection;
using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.CustomAttribute
{
    public class UniqueNameAttribute : ValidationAttribute
    {
        protected override ValidationResult? IsValid(object? value, ValidationContext validationContext)
        {
            var db = validationContext.GetService<dbContext>();

            if (db == null)
            {
                throw new Exception("Database in CustomAttribute is not available in ValidationContext.");
            }

            var name = value?.ToString();

            if (string.IsNullOrWhiteSpace(name))
            {
                return new ValidationResult("Name cannot be empty.");
            }

            var existingName = db.Users.FirstOrDefault(e => e.UserName == name);

            if (existingName == null)
            {
                return ValidationResult.Success;
            }

            return new ValidationResult("This username is already taken.");
        }
    }
}
