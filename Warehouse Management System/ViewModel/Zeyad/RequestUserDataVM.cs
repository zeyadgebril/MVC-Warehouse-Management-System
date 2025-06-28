namespace Warehouse_Management_System.ViewModel.Zeyad
{
    public class RequestUserDataVM
    {
        public int PindingRequests { get; set; }
        public int ApprovedUser { get; set; }
        public int DeclineUser { get; set; }

        public List<ListOfRequestUserVM>? Users { get; set; }

    }
}
