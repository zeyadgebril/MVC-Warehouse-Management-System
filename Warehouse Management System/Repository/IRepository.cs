namespace Warehouse_Management_System.Repository
{
    public interface IRepository<T>where T : class
    {
        public List<T> getAll();
        public T getById(int id);
        public void delete(int id);
        public void Update(T entity,int id);
        public void add(T entity);
    }
}
