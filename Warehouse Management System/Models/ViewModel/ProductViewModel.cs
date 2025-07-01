using System.ComponentModel.DataAnnotations;

namespace Warehouse_Management_System.ViewModels
{
    public class ProductViewModel
    {
        public int ProductId { get; set; }

        [Required(ErrorMessage = "Product name is required")]
        [StringLength(100, ErrorMessage = "Product name cannot exceed 100 characters")]
        [Display(Name = "Product Name")]
        public string Name { get; set; }

        [Display(Name = "Description")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }

        [Display(Name = "Available Stock")]
        public int? AvailableStock { get; set; }

        [Display(Name = "CategoryID")]
        public int? CategoryId { get; set; }

        [Display(Name = "Current Quantity")]
        public int? CurrentQuantity { get; set; }

        [Display(Name = "Minimum Stock Level")]
        public int? MinAvailableStock { get; set; }

        [Display(Name = "Unit Price")]
        [DataType(DataType.Currency)]
        public decimal? UnitPrice { get; set; }

        [Display(Name = "Cost Price")]
        [DataType(DataType.Currency)]
        public decimal? CostPrice { get; set; }

        [Display(Name = "Weight (kg)")]
        public decimal? Weight { get; set; }

        [Display(Name = "Image URL or Path")]
        [StringLength(500, ErrorMessage = "Image path cannot exceed 500 characters")]
        public string ImageURL { get; set; }

        [Display(Name = "Active")]
        public bool? IsActive { get; set; }

        [Display(Name = "Created Date")]
        [DataType(DataType.DateTime)]
        public DateTime? CreatedDate { get; set; }

        [Display(Name = "Last Updated")]
        [DataType(DataType.DateTime)]
        public DateTime? LastUpdated { get; set; }

        [Display(Name = "Category")]
        public string CategoryName { get; set; }
    }
}
