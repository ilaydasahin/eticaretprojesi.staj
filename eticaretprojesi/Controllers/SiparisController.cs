using eticaretprojesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eticaretprojesi.Controllers
{
    [UseAuthorize]
    public class SiparisController : Controller
    {
        eticaretprojesiEntities db = new eticaretprojesiEntities();

        public ActionResult liste()
        {

            var list = db.Siparis.ToList();
            return View(list);
        }

        public ActionResult sil(int id)
        {

            Siparis siparisler = (from x in db.Siparis where x.Id == id select x).FirstOrDefault();

            return View(siparisler);
        }

        [HttpPost, ActionName("sil")]

        public ActionResult silmeislemi(int id)
        {
            Siparis silineceksiparisler = (from x in db.Siparis where x.Id == id select x).FirstOrDefault();

            int? musteri = silineceksiparisler.MusteriID;
            int? SiparisDurumu = silineceksiparisler.SiparisDurumuId;
            int? OdemeYontemi = silineceksiparisler.OdemeYontemiId;
            int? SepetId = silineceksiparisler.SepetDetayId;

            db.Siparis.Remove(silineceksiparisler);
            int sonuc = db.SaveChanges();
            if (sonuc==1)
            {
                TempData["sonuc"] = 1;

            }

            return RedirectToAction("liste");
        }

        public ActionResult siparisdetay(int id)
        {

            var siparisdetay = db.Siparis.Where(x => x.Id == id).FirstOrDefault();

            var siparisdurum = db.SiparisDurumu.ToList().Select(x => new
              SelectListItem
            {
                Selected = false,
                Text=x.Tanim,
                Value=x.Id.ToString()
            }).ToList();

            ViewBag.siparisdurum = siparisdurum;
            return View(siparisdetay);
        }


        [HttpPost]
        public ActionResult siparisdetay(Siparis data)
        {

            try
            {
                var durum = db.Siparis.Where(x => x.Id == data.Id).FirstOrDefault();
                durum.SiparisDurumuId = data.SiparisDurumuId;

                durum.KargoTakip=data.KargoTakip;

                db.SaveChanges();

                return RedirectToAction("liste", data.Id);

            }
            catch (Exception)
            {

                return RedirectToAction("siparisdetay", data.Id);

            }

        }
    }
}