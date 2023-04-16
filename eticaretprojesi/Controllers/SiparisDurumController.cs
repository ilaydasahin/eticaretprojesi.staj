using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class SiparisDurumController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();

        public ActionResult EKle()
        {

            return View();
        }

        [HttpPost]

        public ActionResult EKle(SiparisDurumu data)
        {

            try
            {

                db.SiparisDurumu.Add(data);
                int sonuc = db.SaveChanges();

                if (sonuc==1)
                {
                    TempData["sonuc"] = 1;
                }

                return RedirectToAction("liste");

            }
            catch (Exception)
            {

                return RedirectToAction("Ekle");

            }
        }


        public ActionResult liste()
        {

            var list = db.SiparisDurumu.ToList();

            return View(list);
        }


        public ActionResult sil(int id)
        {

            try
            {
                var silinecekdurum = db.SiparisDurumu.Find(id);
                db.SiparisDurumu.Remove(silinecekdurum);

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

        public ActionResult guncelle(int id)
        {

            var guncelencekdurum = db.SiparisDurumu.Where(x => x.Id == id).FirstOrDefault();
            return View(guncelencekdurum);
        }

        [HttpPost]
        public ActionResult guncelle(SiparisDurumu data)
        {

            try
            {
                var guncelenecekdurum = db.SiparisDurumu.Where(x => x.Id == data.Id).FirstOrDefault();

                guncelenecekdurum.Tanim = data.Tanim;
                guncelenecekdurum.Detay = data.Detay;
                db.SaveChanges();


                return RedirectToAction("liste");
            }
            catch (Exception)
            {

                return RedirectToAction("liste");
            }
        }
    }
}