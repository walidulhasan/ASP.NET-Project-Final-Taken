using ShopOnline_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopOnline_Project.Admin
{
    public partial class Categories : System.Web.UI.Page
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
        public IQueryable categoryGrid_GetData()
        {
            return db.Categories;
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable categoryView_GetData()
        {
            return db.Categories;
        }

        public void categoryView_InsertItem()
        {
            Category c = new Category();
            TryUpdateModel(c);
            if (ModelState.IsValid)
            {
                db.Categories.Add(c);
                db.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void categoryView_UpdateItem(int CategoryId)
        {
            ShopOnline_Project.Models.Category item = null;
            item = db.Categories.Find(CategoryId);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", CategoryId));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                db.SaveChanges();

            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void categoryView_DeleteItem(int CategoryId)
        {
            ShopOnline_Project.Models.Category item = null;
            item = db.Categories.Find(CategoryId);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", CategoryId));
                return;
            }

            db.Categories.Remove(item);
            db.SaveChanges();


        }
    }
}