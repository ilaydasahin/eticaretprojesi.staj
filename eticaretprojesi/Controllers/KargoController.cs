using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class KargoController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();


        public ActionResult Ekle()
        {


            return View();
        }

        [HttpPost]

        public ActionResult Ekle(KargoFirmasi data)
        {

            db.KargoFirmasi.Add(data);

            int sonuc = db.SaveChanges();

            if (sonuc == 1)
            {
                TempData["sonuc"] = 1;

            }

            return RedirectToAction("Ekle");
        }


        public ActionResult liste()
        {
            var kargo = db.KargoFirmasi.ToList();
            return View(kargo);

        }


        public ActionResult sil(int id)
        {

            try
            {
                var silienecekkargo = db.KargoFirmasi.Find(id);
                db.KargoFirmasi.Remove(silienecekkargo);
                int sonuc = db.SaveChanges();

                if (sonuc == 1)
                {
                    TempData["sonuc"] = 1;
                }

                return RedirectToAction("liste");
            }
            catch (Exception)
            {

                return RedirectToAction("liste");

            }
        }

        public ActionResult guncelle(int id)
        {
            try
            {
                var kargofirmasi = db.KargoFirmasi.Where(x => x.Id == id).FirstOrDefault();
                return View(kargofirmasi);
            }
            catch (Exception)
            {

                return RedirectToAction("liste");
            }

        }

        [HttpPost]
        public ActionResult guncelle(KargoFirmasi data)
        {
            try
            {
                var guncelenecekkargo = db.KargoFirmasi.Where(x => x.Id == data.Id).FirstOrDefault();

                guncelenecekkargo.Adres = data.Adres;
                guncelenecekkargo.Eposta = data.Eposta;
                guncelenecekkargo.Sİrket = data.Sİrket;
                guncelenecekkargo.Telefon = data.Telefon;
                guncelenecekkargo.Vergino = data.Vergino;
                guncelenecekkargo.Websitesi = data.Websitesi;

                int sonuc = db.SaveChanges();
                if (sonuc==1)
                {
                    TempData["sonuc"] = 1;

                }

                return RedirectToAction("liste");
            }
            catch (Exception)
            {

                return RedirectToAction("liste");
            }

        }

    }
}