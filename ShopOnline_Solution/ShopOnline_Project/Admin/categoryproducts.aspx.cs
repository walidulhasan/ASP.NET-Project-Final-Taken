using ShopOnline_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopOnline_Project.Admin
{
    public partial class categoryproducts : System.Web.UI.Page
    {
        ShopDbContext db = new ShopDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable ListView1_GetData([QueryString]int c)
        {
            return db.Products.Where(p => p.CategoryId == c);
        }
    }
}