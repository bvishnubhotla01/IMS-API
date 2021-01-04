using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Description;

namespace IMS.API.Controllers
{
    public class ProductsController : ApiController
    {
        private IMSEntities db = new IMSEntities();

        // GET: api/Products
        [HttpGet]
        public IQueryable<Product> GetProducts()
        {
            return db.Products;
        }

        // GET: api/Products/get/5
        [HttpGet]
        [ActionName("get")]
        [ResponseType(typeof(Product))]
        public IHttpActionResult GetProduct(int id)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return NotFound();
            }

            return Ok(product);
        }

        // PUT: api/Products/edit
        [HttpPost]
        [ActionName("edit")]
        [ResponseType(typeof(bool))]
        public IHttpActionResult UpdateProduct(Product product)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("false");
            }

            db.Entry(product).State = EntityState.Modified;            
            db.SaveChanges();            
            
            return Ok(true);

        }

        // POST: api/Products/create
        [HttpPost]
        [ActionName("create")]
        [ResponseType(typeof(Product))]
        public IHttpActionResult PostProduct(Product product)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Products.Add(product);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = product.ProductID }, product);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        // POST: api/Products/delete
        [HttpPost]
        [ActionName("delete")]
        [ResponseType(typeof(bool))]
        public IHttpActionResult DeleteProduct([FromBody]Product[] Products)
        {
            if (ModelState.IsValid)
            {
                foreach (Product product in Products)
                {
                    Product product1 = db.Products.FirstOrDefault(p => p.ProductID == product.ProductID);
                    if (product1 == null)
                    {
                        return NotFound();
                    }
                    else
                    {
                        db.Products.Remove(product1);
                        db.SaveChanges();
                    }
                }
            }
            else
            {
                return NotFound();
            }
                
            return Ok(true);
        }
    }
}