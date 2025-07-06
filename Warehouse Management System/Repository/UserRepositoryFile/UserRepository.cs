using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.UserRepositoryFile
{
    public class UserRepository :IUserRepository
    {
        private readonly dbContext _context;
        public UserRepository(dbContext context)
        {
            _context = context;
        }

        public void add(ApplicationUser entity)
        {
            throw new NotImplementedException();
        }

        public void delete(ApplicationUser entity)
        {
            throw new NotImplementedException();
        }

        public List<ApplicationUser> getAll()
        {
            throw new NotImplementedException();
        }

        public ApplicationUser getById(string id)
        {
            return _context.Users.Where(x=>x.Id ==id && (x.IsDeleted == false || x.IsDeleted == null)).FirstOrDefault();
        }

        public ApplicationUser getById(int id)
        {
            throw new NotImplementedException();
        }

        public void Update(ApplicationUser entity)
        {
            ApplicationUser us = getById(entity.Id);
            if (us == null) {
                throw new InvalidOperationException($"User with ID {entity.Id} not found");
            }
            us.FullName=entity.FullName;
        }
    }
}
