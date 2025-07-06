namespace Warehouse_Management_System.ViewModel.Zeyad
{
    public class DashpoardData
    {
        public int totalUsers { get; set; }
        public int thisMonth { get; set; }
        public string activeRate { get; set; }
        public int onlineNow { get; set; }
        public virtual userGrowth userGrowth { get; set; } = new userGrowth();
        public virtual loginDistribution loginDistribution { get; set; } = new loginDistribution();
        public virtual List<recentLogins> recentLogins { get; set; } = new List<recentLogins>();
    }


}
