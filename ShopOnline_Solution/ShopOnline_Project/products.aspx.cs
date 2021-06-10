using ShopOnline_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopOnline_Project
{
    public partial class products : System.Web.UI.Page
    {
        ShopDbContext db = new ShopDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<ShopOnline_Project.Models.Product> productRepeater_GetData([QueryString]int id)
        {
            return db.Products.Include("Category").Where(p=> p.CategoryId == id);
        }
    }
}