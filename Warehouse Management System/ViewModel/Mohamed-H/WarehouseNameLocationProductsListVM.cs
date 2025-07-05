using Warehouse_Management_System.Models;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;


namespace Warehouse_Management_System.ViewModel.Mohamed_H

{
    public class WarehouseNameLocationProductsListVM
    {
        public int ID { get; set; }
        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Location is required")]
        public string Location { get; set; }
        [Required(ErrorMessage = "Phone is required")]
        [Phone(ErrorMessage = "Invalid phone number")]
        public string Phone { get; set; }
        [ValidateNever]
        public List<ProductDetailsVM> Productsdetails { get; set; }
        [ValidateNever]
        public int ProductStock { get; set; }
        [ValidateNever]
        public int ProductCount { get; set; }
        [ValidateNever]
        public int LowStockCount { get; set; }
        [ValidateNever]
        public DateTime? LastUpdate { get; set; }
        [ValidateNever]
        public bool IsDeleted { get; set; }

    }
}
