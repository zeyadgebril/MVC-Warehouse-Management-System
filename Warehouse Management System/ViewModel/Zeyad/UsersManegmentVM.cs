namespace Warehouse_Management_System.ViewModel.Zeyad
{
    public class UsersManegmentVM
    {
        public string userId { get; set; }
        public string UserName { get; set; }
        public bool Activitistatus { get; set; }
        public bool AppApproval { get; set; }
        public string LastLog { get; set; }
        public virtual SuspendOrApproveUserVM UserAction { get; set; } = new SuspendOrApproveUserVM();
    }
}
