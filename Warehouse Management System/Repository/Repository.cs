
using Warehouse_Management_System.Models;

namespace Warehouse_Management_System.Repository
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        public MvcDbContextContext Db { get; }

        public Repository(MvcDbContextContext db)
        {
            Db = db;
        }


        public void add(TEntity entity)
        {
            Db.Set<TEntity>().Add(entity);
        }

        public void delete(TEntity entity)
        {
            Db.Set<TEntity>().Remove(entity);
        }

        public List<TEntity> getAll()
        {
            return Db.Set<TEntity>().ToList();
        }

        public TEntity getById(int id)
        {
            return Db.Set<TEntity>().Find(id);
            
        }

        public void Update(TEntity entity)
        {
            Db.Entry(entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
        }
    }
}
