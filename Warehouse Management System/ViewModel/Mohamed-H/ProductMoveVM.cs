using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace Warehouse_Management_System.ViewModel.Mohamed_H
{
    public class ProductMoveVM
    {
        [ValidateNever]
        public string ProductName { get; set; }
        [ValidateNever]
        public string WarehouseName { get; set; }
        public int WarehouseId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public string MoveType { get; set; }
        public DateTime Date { get; set; }

    }
}
