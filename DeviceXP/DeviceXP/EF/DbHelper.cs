using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
namespace test.EF
{
    public class DbHelper:DbContext
    {
        public DbHelper(): base("name=connstr")
        {
            Database.SetInitializer<DbHelper>(null);
            this.Database.Log = Log;
        }
        private void Log(string message)
        { 
            Console.WriteLine(message);
        }
        public virtual DbSet<Operation> Operation { get; set; }
        public virtual DbSet<Patient> Patient { get; set; }
    }
}
