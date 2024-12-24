// lib/widgets/haber_card.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/news.dart';
import '../pages/haber_detay_page.dart';

class HaberCard extends StatelessWidget {
  final Haber haber;

  HaberCard({required this.haber});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HaberDetayPage(haber: haber),
            ),
          );
        },
        child: Column(
          children: [
            // Haber Resmi
            haber.haberResim.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: CachedNetworkImage(
                      imageUrl: haber.haberResim,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: double.infinity,
                        height: 180,
                        color: Colors.grey[200],
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: double.infinity,
                        height: 180,
                        color: Colors.grey[200],
                        child: Icon(Icons.error, size: 50, color: Colors.grey[400]),
                      ),
                    ),
                  )
                : Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                    ),
                    child: Icon(Icons.image, size: 100, color: Colors.grey[400]),
                  ),
            // Haber Bilgileri
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Haber Başlığı
                  Text(
                    haber.haberManset,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 8.0),
                  // Haber Açıklaması
                  Text(
                    haber.haberAciklama,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 12.0),
                  // Haber Kategorisi ve Tarihi
                  Row(
                    children: [
                      Icon(Icons.category, size: 16.0, color: Colors.grey[600]),
                      SizedBox(width: 4.0),
                      Text(
                        haber.haberKategorisi,
                        style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                      ),
                      Spacer(),
                      Icon(Icons.calendar_today, size: 16.0, color: Colors.grey[600]),
                      SizedBox(width: 4.0),
                      Text(
                        haber.haberTarihi,
                        style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}