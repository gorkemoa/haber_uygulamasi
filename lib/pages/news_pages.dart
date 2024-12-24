// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import '../models/news.dart';
import '../services/api_service.dart';
import '../widgets/category_selector.dart';
import 'haber_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  List<Haber> haberler = [];
  bool isLoading = true;
  String selectedCategory = 'Ana Sayfa';

  // Kategori Listesi
  final List<String> categories = [
    'Ana Sayfa',
    'Son Dakika',
    'Spor',
    'Gündem',
    'Ekonomi',
    'Dünya',
    'Sağlık',
    'Yaşam',
    'Kültür Sanat',
    'Eğitim',
    'Türkiye',
  ];

  @override
  void initState() {
    super.initState();
    fetchHaberler();
  }

  Future<void> fetchHaberler() async {
    String kategoriParam = selectedCategory.toLowerCase();
    if (kategoriParam == 'ana sayfa') {
      kategoriParam = '';
    }

    try {
      List<Haber> fetchedHaberler = await apiService.fetchHaberList(
        tur: 'xml_genel',
        kategori: kategoriParam,
        adet: 20,
        selectEx: 'yorumSay,okunmaadedi,anasayfamanset,kategorimanset',
      );
      setState(() {
        haberler = fetchedHaberler;
        isLoading = false;
      });
    } catch (e) {
      print("Haberleri çekerken hata: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Haberler yüklenirken bir hata oluştu')),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  void onCategorySelected(String kategori) {
    setState(() {
      selectedCategory = kategori;
      isLoading = true;
      haberler = [];
    });
    fetchHaberler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Türkiye Haberleri',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Kategori Seçici
          CategorySelector(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: onCategorySelected,
          ),
          // Haber Listesi
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : haberler.isEmpty
                    ? Center(child: Text('Haber bulunamadı.', style: TextStyle(fontSize: 16.0)))
                    : RefreshIndicator(
                        onRefresh: fetchHaberler,
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: haberler.length,
                          itemBuilder: (context, index) {
                            final haber = haberler[index];
                            return HaberCard(haber: haber);
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}