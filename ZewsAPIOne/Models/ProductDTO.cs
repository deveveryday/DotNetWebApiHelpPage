using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ZewsAPIOne.Models
{
    public class ProductDTO
    {
        [Key]
        public int ProductID { get; set; }
        public decimal Price { get; set; }
        public string Name { get; set; }
    }
}