using ShopOnline_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopOnline_Project.Admin
{
    public partial class products : System.Web.UI.Page
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
        public IQueryable<ShopOnline_Project.Models.Product> productView_GetData()
        {
            return db.Products;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void productView_DeleteItem(int productId)
        {
            ShopOnline_Project.Models.Product item = null;
            item = db.Products.Find(productId);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", productId));
                return;
            }

            db.Products.Remove(item);
            db.SaveChanges();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void productView_UpdateItem(int productId)
        {
            ShopOnline_Project.Models.Product item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            item = db.Products.Find(productId);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", productId));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                db.SaveChanges();
            }
        }
    }
}