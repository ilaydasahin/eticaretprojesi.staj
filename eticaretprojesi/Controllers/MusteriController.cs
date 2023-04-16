using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class MusteriController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();

        public ActionResult liste()
        {
            var musteri = db.Musteri.ToList();


            return View(musteri);
        }

        public ActionResult guncelle(int id)
        {


            var guncelenecekmusteri = db.Musteri.Where(x => x.Id == id).FirstOrDefault();

            return View(guncelenecekmusteri);
        }

        [HttpPost]

        public ActionResult guncelle(Musteri data)
        {

            var guncelenecekmusteri = db.Musteri.Where(x => x.Id == data.Id).FirstOrDefault();

            guncelenecekmusteri.adi = data.adi;
            guncelenecekmusteri.DogumTArihi = data.DogumTArihi;
            guncelenecekmusteri.Eposta = data.Eposta;
            guncelenecekmusteri.FaturaAdresi = data.FaturaAdresi;
            guncelenecekmusteri.Sifre = data.Sifre;
            guncelenecekmusteri.Soyadi = data.Soyadi;
            guncelenecekmusteri.TeslimatAdresi = data.TeslimatAdresi;

            db.SaveChanges();

            return View(guncelenecekmusteri);
        }
    }
}