using ShopOnline_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
namespace ShopOnline_Project.Secured
{
    public partial class confirmorder : System.Web.UI.Page
    {
        ShopDbContext db = new ShopDbContext();
        ApplicationUserManager manager;
        ApplicationUser user;
        Customer customer;
        protected void Page_Load(object sender, EventArgs e)
        {
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            user = manager.FindByName(Context.User.Identity.Name);
            customer = db.Customers.First(c => c.UserId == user.Id);
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable detailsGrid_GetData()
        {
            var query = db.CartItems.Where(item => item.CustomerId == customer.CustomerId).Select(item => new CartItemVM { CartItemId = item.CartItemId, CustomerId = item.CartItemId, ProductId = item.ProductId, Quantity = item.Quantity }).ToList();
            foreach (var x in query)
            {
                var product = db.Products.First(p => p.ProductId == x.ProductId);
                x.ProductName = product.ProductName;
                x.UnitPrice = product.UnitPrice;
                x.Amount = x.Quantity * product.UnitPrice;
            }
            return query.AsQueryable();
          
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable billingGrid_GetData()
        {
            return db.Customers.Where(c => c.UserId == user.Id);
            
        }
    }
}