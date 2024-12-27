using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;

namespace test.EF
{
    public class Repository<T> : IDisposable where T : class
    {
        public DbHelper dbHelper = new DbHelper();
        private bool disposedValue;

        public IQueryable<T> AAA<T>(string strSql)
        {
            return (IQueryable<T>)dbHelper.Database.SqlQuery<T>(strSql).AsQueryable().AsNoTracking();
        }

        protected virtual void Dispose(bool disposing)
        {
            dbHelper.Dispose();
        }

        // // TODO: 仅当“Dispose(bool disposing)”拥有用于释放未托管资源的代码时才替代终结器
        // ~Repository()
        // {
        //     // 不要更改此代码。请将清理代码放入“Dispose(bool disposing)”方法中
        //     Dispose(disposing: false);
        // }

        public void Dispose()
        {
            // 不要更改此代码。请将清理代码放入“Dispose(bool disposing)”方法中
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }
    }
}
