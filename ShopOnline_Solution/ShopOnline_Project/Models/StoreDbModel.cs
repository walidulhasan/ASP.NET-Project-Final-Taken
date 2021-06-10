using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ShopOnline_Project.Models
{
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }
        [Required, StringLength(30)]
        public string CategoryName { get; set; }

        //Navigation
        public virtual IList<Product> Products { get; set; }
    }

    public class Product
    {
        public int ProductId { get; set; }
        [Required, StringLength(50)]
        public string ProductName { get; set; }
        [Required]
        public decimal UnitPrice { get; set; }
        [Required, StringLength(500)]
        public string Description { get; set; }
        [StringLength(150)]
        public string PictureFile { get; set; }

        //FK
        [Required]
        [ForeignKey("Category")]
        public int CategoryId { get; set; }
        //Navigation
        public virtual Category Category { get; set; }
        public virtual IList<OrderItem> OrderItems { get; set; }
    }
    public class Customer
    {
        public int CustomerId { get; set; }
        [Required, StringLength(120)]
        public string UserId { get; set; }
        [StringLength(60)]
        public string CustomerName { get; set; }
        [StringLength(500)]
        public string Address { get; set; }
        [CreditCard]
        public string CCNumber { get; set; }
        [Column(TypeName = "date")]
        public DateTime? CCExpire { get; set; }
        //Navigation
        public virtual IList<Order> Orders { get; set; }
    }
    public class Order
    {
        public int OrderId { get; set; }
        [Required]
        public DateTime OrderDate { get; set; }
        [Column(TypeName="date")]
        public DateTime? ShippedDate { get; set; }
        //FK
        [Required, ForeignKey("Customer")]
        public int CustomerId { get; set; }
        //Navigation
        public virtual Customer Customer { get; set; }
        public virtual IList<OrderItem> OrderItems { get; set; }
    }
    public class OrderItem
    {
        [Key, Column(Order=0)]
        [ForeignKey("Order")]
        public int OrderId { get; set; }
         [Key, Column(Order = 1)]
         [ForeignKey("Product")]
        public int ProductId { get; set; }

         [Required]
         public int Quantity { get; set; }
        //Navligation
         public virtual Order Order { get; set; }
         public virtual Product Product { get; set; }
    }
    public class CartItem
    {
        public int CartItemId { get; set; }
        [Required]
        public int ProductId { get; set; }
        [Required]
        public int CustomerId { get; set; }
        [Required]
        public int Quantity { get; set; }

    }
    public class ShopDbContext : DbContext
    {
       public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        
        public DbSet<CartItem> CartItems { get; set; }
      
    }
}