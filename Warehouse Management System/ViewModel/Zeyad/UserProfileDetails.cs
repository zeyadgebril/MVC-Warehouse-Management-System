namespace Warehouse_Management_System.ViewModel.Zeyad
{
    public class UserProfileDetails
    {
        public string Fullname{ get; set; }
        public string Email { get; set; }
        public string Location { get; set; }
        public string? Phone { get; set; }
        public DateTime MemberSince { get; set; }
        public string UserId { get; set; }
        public bool AccountStatus { get; set; }
        public int TotalLogins { get; set; }
        public DateTime LastLogin { get; set; }
    }
}
