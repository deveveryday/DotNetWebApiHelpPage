using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using ZewsAPIOne.Models;

namespace ZewsAPIOne.Controllers
{
    public class SellsController : ApiController
    {
        List<SellDTO> list = new List<SellDTO>();

        public SellsController()
        {
        }

        /// <summary xml:lang="en-US">Sells list</summary>
        /// <returns xml:lang="en-US">List<Sells></Sells></returns>
        /// <summary xml:lang="pt-BR">Vendas</summary>
        /// <returns xml:lang="pt-BR">Lista de vendas</returns>
        public IQueryable Get()
        {


            return list.AsQueryable();
        }

        /// <summary xml:lang="en-US">Post a Product</summary>
        /// <summary xml:lang="pt-BR">Postar Produtos</summary>
        /// <param name="body">json of Product</param>
        public void Post([FromBody]JObject body)
        {
            var column1Name = "agreement";
            var value1 = string.Empty;

            if (body.ContainsKey(column1Name))
            {
                value1 = body.GetValue(column1Name).ToString();
            }
            
        }

        
    }
}