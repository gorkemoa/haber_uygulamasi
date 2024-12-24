// lib/pages/haber_detay_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/news.dart';

class HaberDetayPage extends StatelessWidget {
  final Haber haber;

  HaberDetayPage({required this.haber});

  @override
  Widget build(BuildContext context) {
    final String detayUrl = 'https://www.trthaber.com/${haber.haberLink}';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          haber.haberManset,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Haber Resmi
              haber.haberResim.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        imageUrl: haber.haberResim,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[200],
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[200],
                          child: Icon(Icons.error, size: 50, color: Colors.grey[400]),
                        ),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[200],
                      child: Icon(Icons.image, size: 100, color: Colors.grey[400]),
                    ),
              SizedBox(height: 16.0),
              // Haber Başlığı
              Text(
                haber.haberManset,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              // Haber Kategorisi ve Tarihi
              Row(
                children: [
                  Icon(Icons.category, size: 20.0, color: Colors.grey[600]),
                  SizedBox(width: 4.0),
                  Text(
                    haber.haberKategorisi,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  ),
                  Spacer(),
                  Icon(Icons.calendar_today, size: 20.0, color: Colors.grey[600]),
                  SizedBox(width: 4.0),
                  Text(
                    haber.haberTarihi,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              // Haber Açıklaması
              Text(
                haber.haberAciklama,
                style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
              ),
              SizedBox(height: 16.0),
              // Haber Metni (HTML İçerik)
              Html(
                data: haber.haberMetni,
                style: {
                  "p": Style(fontSize: FontSize(16.0), lineHeight: LineHeight.number(1.5)),
                  "h2": Style(fontSize: FontSize(20.0), fontWeight: FontWeight.bold),
                  "a": Style(color: Colors.blueAccent),
                  "img": Style(
                    // height parametresi kaldırıldı veya doğru şekilde ayarlandı
                  ),
                },
                
                // onImageTap kaldırıldı veya farklı bir yöntemle ele alınabilir
              ),
              SizedBox(height: 16.0),
              // Haber Detayına Git Butonu
              ElevatedButton(
                onPressed: () async {
                  if (await canLaunch(detayUrl)) {
                    await launch(detayUrl);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('URL açılamadı')),
                    );
                  }
                },
                child: Text('Haber Detayına Git'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}