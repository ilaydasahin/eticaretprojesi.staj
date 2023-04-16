using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class SiteAyarlariController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();
        public ActionResult Ekle()
        {
            ViewBag.mailayar = db.MailAyarlari.ToList();
            ViewBag.sosyalmedia = db.SosyalMedya.ToList();
            ViewBag.seo = db.Seo.ToList();
            ViewBag.iletisim = db.SiteAyarlari.ToList();


            return View("Ekle");
        }

        [HttpPost]

        public ActionResult seo(Seo data)
        {

            Seo gunecellenecekseo = db.Seo.Where(x => x.Id == 1).FirstOrDefault();

            gunecellenecekseo.Baslik = data.Baslik;
            gunecellenecekseo.Anahtar_kelime = data.Anahtar_kelime;
            gunecellenecekseo.Harita = data.Harita;
            gunecellenecekseo.Title = data.Title;

           int sonuc= db.SaveChanges();

            if (sonuc==1)
            {
                TempData["sonuc"] = 1;
            }

            return RedirectToAction("Ekle");
        }

        [HttpPost]
        public ActionResult sosyalmediq(SosyalMedya data)
        {

            SosyalMedya guncelleneceksosyalmedia = db.SosyalMedya.Where(x => x.Id == 1).FirstOrDefault();

            guncelleneceksosyalmedia.Facebook = data.Facebook;
            guncelleneceksosyalmedia.Instagram = data.Instagram;
            guncelleneceksosyalmedia.twitter = data.twitter;
            guncelleneceksosyalmedia.Youtube = data.Youtube;

            int sonuc = db.SaveChanges();
            if (sonuc==1)
            {
                TempData["sonuc"] = 1;

            }

            return RedirectToAction("Ekle");

        }

        [HttpPost]
        public ActionResult siteayarlari(SiteAyarlari data)
        {

            SiteAyarlari guncelleneceksiteayarlari = db.SiteAyarlari.Where(x => x.Id == 1).FirstOrDefault();

            guncelleneceksiteayarlari.Adres = data.Adres;
            guncelleneceksiteayarlari.Eposta = data.Eposta;
            guncelleneceksiteayarlari.Telefon = data.Telefon;
            guncelleneceksiteayarlari.Whatsapp = data.Whatsapp;
            

            int sonuc = db.SaveChanges();
            if (sonuc == 1)
            {
                TempData["sonuc"] = 1;

            }

            return RedirectToAction("Ekle");

        }

        [HttpPost]
        public ActionResult mailayarlari(MailAyarlari data)
        {

            MailAyarlari guncellenecekmailayarlari = db.MailAyarlari.Where(x => x.Id == 1).FirstOrDefault();

            guncellenecekmailayarlari.Eposta = data.Eposta;
            guncellenecekmailayarlari.Eposta_Sifresi = data.Eposta_Sifresi;
            guncellenecekmailayarlari.Gonderici_bilgisi = data.Gonderici_bilgisi;
            guncellenecekmailayarlari.Mail_gonderici = data.Mail_gonderici;
            guncellenecekmailayarlari.Smtp_port = data.Smtp_port;
            guncellenecekmailayarlari.Smtp_server = data.Smtp_server;
            


            int sonuc = db.SaveChanges();
            if (sonuc == 1)
            {
                TempData["sonuc"] = 1;

            }

            return RedirectToAction("Ekle");

        }

    }
}