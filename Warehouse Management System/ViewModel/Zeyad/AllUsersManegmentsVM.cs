namespace Warehouse_Management_System.ViewModel.Zeyad
{
    public class AllUsersManegmentsVM
    {
        public int TotalUsers{ get; set; }
        public int ActiveUser { get; set; }
        public int InactiveUser { get; set; }
        public int Suspended { get; set; }
        public int TotalUsersInRole { get; set; }
        public int TotalPages { get; set; }
        public int  CurrentPage { get; set; }
        public string? searchValue { get; set; }
        public string? Status { get; set; }
        public List<UsersManegmentVM>? Users { get; set; } = new List<UsersManegmentVM>();
    }
}
