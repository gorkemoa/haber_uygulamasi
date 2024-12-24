// lib/models/haber.dart
import 'package:xml/xml.dart' as xml;

class Haber {
  final String haberManset;
  final String haberResim;
  final String haberLink;
  final String haberId;
  final String haberAciklama;
  final String haberMetni;
  final String haberKategorisi;
  final String haberTarihi;
  final String mansetResim;
  final int yorumSay;
  final int okunmaAdedi;
  final int anasayfaManset;
  final int kategorimanset;

  Haber({
    required this.haberManset,
    required this.haberResim,
    required this.haberLink,
    required this.haberId,
    required this.haberAciklama,
    required this.haberMetni,
    required this.haberKategorisi,
    required this.haberTarihi,
    required this.mansetResim,
    required this.yorumSay,
    required this.okunmaAdedi,
    required this.anasayfaManset,
    required this.kategorimanset,
  });

  factory Haber.fromXml(xml.XmlElement element) {
    return Haber(
      haberManset: element.getElement('haber_manset')?.innerText ?? '',
      haberResim: element.getElement('haber_resim')?.innerText ?? '',
      haberLink: element.getElement('haber_link')?.innerText ?? '',
      haberId: element.getElement('haber_id')?.innerText ?? '',
      haberAciklama: element.getElement('haber_aciklama')?.innerText ?? '',
      haberMetni: element.getElement('haber_metni')?.innerText ?? '',
      haberKategorisi: element.getElement('haber_kategorisi')?.innerText ?? '',
      haberTarihi: element.getElement('haber_tarihi')?.innerText ?? '',
      mansetResim: element.getElement('manset_resim')?.innerText ?? '',
      yorumSay: int.tryParse(element.getElement('yorumSay')?.innerText ?? '0') ?? 0,
      okunmaAdedi: int.tryParse(element.getElement('okunmaadedi')?.innerText ?? '0') ?? 0,
      anasayfaManset: int.tryParse(element.getElement('anasayfamanset')?.innerText ?? '0') ?? 0,
      kategorimanset: int.tryParse(element.getElement('kategorimanset')?.innerText ?? '0') ?? 0,
    );
  }
}