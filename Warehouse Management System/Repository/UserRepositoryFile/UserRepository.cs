using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository.UserRepositoryFile
{
    public class UserRepository : IUserRepository
    {
        private readonly MvcDbContextContext _context;
        public UserRepository(MvcDbContextContext context)
        {
            _context = context;
        }
        public void add(User entity)
        {
            throw new NotImplementedException();
        }

        public void delete(User entity)
        {
            throw new NotImplementedException();
        }

        public List<User> getAll()
        {
            throw new NotImplementedException();
        }

        public User getById(string id)
        {
            return _context.Users.Where(x=>x.UserID ==id && (x.isDeleted == false || x.isDeleted == null)).FirstOrDefault();
        }

        public User getById(int id)
        {
            throw new NotImplementedException();
        }

        public void Update(User entity)
        {
            User us = getById(entity.UserID);
            if (us == null) {
                throw new InvalidOperationException($"User with ID {entity.UserID} not found");
            }
            us.FullName=entity.FullName;
        }
    }
}
