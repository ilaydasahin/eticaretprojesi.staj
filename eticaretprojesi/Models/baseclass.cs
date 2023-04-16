using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eticaretprojesi.Models
{
    public class baseclass
    {

        public int Id { get; set; }
        public DateTime KayitTarihi { get; set; }
        public DateTime GuncelemeTarihi { get; set; }
        public bool Silindimi { get; set; }
    }
}