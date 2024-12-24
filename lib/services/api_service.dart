// lib/services/api_service.dart
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

import '../models/news.dart';

class ApiService {
  // Base URL
  final String baseUrl = "http://www.trthaber.com/xml_mobile.php";

  // Fetch Haber List based on category
  Future<List<Haber>> fetchHaberList({String tur = 'xml_genel', String kategori = '', int adet = 20, String selectEx = 'yorumSay,okunmaadedi,anasayfamanset,kategorimanset'}) async {
    final String url = '$baseUrl?tur=$tur&kategori=$kategori&adet=$adet&selectEx=$selectEx';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final document = xml.XmlDocument.parse(response.body);
        final haberler = document.findAllElements('haber');

        return haberler.map((element) => Haber.fromXml(element)).toList();
      } else {
        throw Exception("Haberler yüklenemedi: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("API Çağrısı Hatası: $e");
      throw Exception("Haberler yüklenirken hata oluştu: $e");
    }
  }
}