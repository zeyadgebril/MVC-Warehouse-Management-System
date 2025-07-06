using System.Security.Claims;

namespace Warehouse_Management_System.Repository.AccountRepositoryFile
{
    public interface IAccountRepository
    {
        public int GetNumberOfSuspended();
        public void SignOutFormApplication(Claim AddressClaim);
        public void MakeHimLookOfflineForAdmin(String id);
        public void MakeHimLookOnlineForAdmin(String id);

    }
}
