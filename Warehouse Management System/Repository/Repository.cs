
namespace Warehouse_Management_System.Repository
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        public void add(TEntity entity)
        {
            throw new NotImplementedException();
        }

        public void delete(TEntity entity)
        {
            throw new NotImplementedException();
        }

        public List<TEntity> getAll()
        {
            throw new NotImplementedException();
        }

        public TEntity getById(int id)
        {
            throw new NotImplementedException();
        }

        public void Update(TEntity entity)
        {
            throw new NotImplementedException();
        }
    }
}
