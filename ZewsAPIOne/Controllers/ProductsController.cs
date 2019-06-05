using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Web.Http;
using System.Web.Http.Description;
using ZewsAPIOne.Models;

namespace ZewsAPIOne.Controllers
{
    public class ProductsController : ApiController
    {
        private ZewsAPIOneContext db = new ZewsAPIOneContext();

        private List<ProductDTO> products = new List<ProductDTO>()
        {
            new ProductDTO()
            {
                ProductID = 1,
                Name = "Apple IPhone 5"
            },
            new ProductDTO()
            {
                ProductID = 1,
                Name = "Apple IPhone 5"
            },
                        new ProductDTO()
            {
                ProductID = 1,
                Name = "Apple IPhone 5"
            },
            new ProductDTO()
            {
                ProductID = 1,
                Name = "Apple IPhone 5"
            }
        };

        /// <summary>
        /// Lista de produtos
        /// </summary>
        /// <returns></returns>
        // GET: api/Products
        public IQueryable<ProductDTO> GetProduct()
        {
            return products.AsQueryable();
            //return db.ProductDTOes;
        }

        // GET: api/Products/5
        [ResponseType(typeof(ProductDTO))]
        public IHttpActionResult GetProduct(int id)
        {
            ProductDTO productDTO = db.ProductDTOes.Find(id);
            if (productDTO == null)
            {
                return NotFound();
            }

            return Ok(productDTO);
        }

        // PUT: api/Products/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProduct(int id, ProductDTO productDTO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != productDTO.ProductID)
            {
                return BadRequest();
            }

            db.Entry(productDTO).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductDTOExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Products
        [ResponseType(typeof(ProductDTO))]
        public IHttpActionResult PostProduct(ProductDTO productDTO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ProductDTOes.Add(productDTO);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = productDTO.ProductID }, productDTO);
        }

        // DELETE: api/Products/5
        [ResponseType(typeof(ProductDTO))]
        public IHttpActionResult DeleteProduct(int id)
        {
            ProductDTO productDTO = db.ProductDTOes.Find(id);
            if (productDTO == null)
            {
                return NotFound();
            }

            db.ProductDTOes.Remove(productDTO);
            db.SaveChanges();

            return Ok(productDTO);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductDTOExists(int id)
        {
            return db.ProductDTOes.Count(e => e.ProductID == id) > 0;
        }
    }
}