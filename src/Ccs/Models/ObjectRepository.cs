//using System;
//using System.Linq;
//using System.Linq.Expressions;
//using System.Web.Mvc;

//using Db4objects.Db4o.Linq;

//namespace Ccs.Site.Models
//{
//  public abstract class ObjectRepository<T> : IRepository<T> where T : class
//  {
//    /// <summary>
//    /// Returns all T records in the repository
//    /// </summary>
//    /// <returns></returns>
//    public virtual IQueryable<T> GetAll()
//    {
//      return (from T items in ObjectDatabase.Container
//              select items).AsQueryable();
//    }

//    /// <summary>
//    /// Returns a PagedList of items
//    /// </summary>
//    /// <param name="pageIndex">zero-based index to be used for lookup</param>
//    /// <param name="pageSize">the size of the paged items</param>
//    /// <returns></returns>
//    public virtual PagedList<T> GetPaged(int pageIndex, int pageSize)
//    {
//      var query = (from T items in ObjectDatabase.Container
//                   select items).AsQueryable();
//      return new PagedList<T>(query, pageIndex, pageSize);
//    }

//    /// <summary>
//    /// Finds an item using a passed-in expression lambda
//    /// </summary>
//    /// <param name="expression">The expression.</param>
//    /// <returns></returns>
//    public virtual IQueryable<T> Find(Expression<Func<T, bool>> expression)
//    {
//      return GetAll().Where(expression);
//    }

//    /// <summary>
//    /// Saves an item to the database
//    /// </summary>
//    /// <param name="item">The item.</param>
//    public virtual void Save(T item)
//    {
//      ObjectDatabase.Container.Store(item);
//    }

//    /// <summary>
//    /// Deletes an item from the database
//    /// </summary>
//    /// <param name="item">The item.</param>
//    public virtual void Delete(T item)
//    {
//      ObjectDatabase.Container.Delete(item);
//    }

//    public abstract void Update(T entity);

//    /// <summary>
//    /// Gets the count of.
//    /// </summary>
//    /// <value>The count.</value>
//    /// <typeparam name="T"></typeparam>
//    /// <returns></returns>
//    public virtual int Count
//    {
//      get { return ObjectDatabase.Container.Query(typeof (T)).Count; }
//    }

//    /// <summary>
//    /// Deletes the by.
//    /// </summary>
//    /// <param name="id">The id.</param>
//    public virtual void DeleteBy(Guid id)
//    {
//      var q = (from Speaker s in ObjectDatabase.Container
//               where s.Id == id
//               select s).First();

//      ObjectDatabase.Container.Delete(q);
//    }
//  }

//  public class SpeakerRepository : ObjectRepository<Speaker> {
//    public override void Update(Speaker entity)
//    {
//      throw new NotImplementedException();
//    }
//  }
//}