using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eticaretprojesi.Models
{
    public class Durum
    {

        private Models.eticaretprojesiEntities db;

        public Durum()
        {

            db = new Models.eticaretprojesiEntities();

        }

        public durummodel durummodell()
        {
            durummodel model = new durummodel();

            model.siparissayisi = db.Siparis.Count();
            model.siparisbekleyen = db.Siparis.Where(x => x.SiparisDurumuId == 1).Count();
            model.musterisayisi = db.Musteri.Count();
            model.urunsayısı = db.Urunler.Count();

            return model;

        }

        public class durummodel
        {

            public int urunsayısı { get; set; }
            public int musterisayisi { get; set; }
            public int siparissayisi { get; set; }

            public int siparisbekleyen { get; set; }

        }

    }





}
