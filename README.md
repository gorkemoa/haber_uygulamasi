# Türkiye Haberleri Uygulaması 🇹🇷📰

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

## 📱 Proje Hakkında

Türkiye'nin en güncel haberlerini kullanıcı dostu ve estetik bir arayüzle sunmayı hedefleyen **Türkiye Haberleri Uygulaması**'na hoş geldiniz! Bu uygulama, farklı kategorilerdeki haberleri hızlıca görüntülemenizi ve detaylı içeriklere kolayca erişmenizi sağlar.

## 🚀 Özellikler

- **Kategori Seçici:** Ana Sayfa, Son Dakika, Spor, Gündem, Ekonomi, Dünya, Sağlık, Yaşam, Kültür Sanat, Eğitim ve Türkiye gibi çeşitli kategoriler arasında kolayca geçiş yapabilirsiniz.
- **Haber Listesi:** Seçtiğiniz kategoriye göre düzenlenmiş haberlerin listesi.
- **Haber Detayları:** Her haberin detayına erişebilir, zengin HTML içeriği ve yüksek kaliteli görsellerle haberi derinlemesine okuyabilirsiniz.
- **Görsel Önbellekleme:** `cached_network_image` paketi sayesinde görseller hızlı yüklenir ve önbelleğe alınır.
- **HTML İçerik Render Etme:** `flutter_html` paketi ile haber metinlerinde bulunan HTML etiketleri düzgün şekilde görüntülenir.
- **Sonsuz Kaydırma (Infinite Scrolling):** Haberleri sürekli kaydırarak yeni içeriklerin otomatik olarak yüklenmesini sağlar.
- **Tam Ekran Görüntüleme:** Haber detaylarındaki görsellere tıklayarak tam ekran görüntüleme özelliği.
- **URL Açma:** Haber detaylarına ait bağlantıları doğrudan tarayıcıda açabilirsiniz.

## 🛠 Teknolojiler

- **Flutter:** Mobil uygulama geliştirme framework'ü.
- **Dart:** Flutter ile uygulama geliştirmek için kullanılan programlama dili.
- **flutter_html:** HTML içeriği Flutter widget'ları olarak render etmek için.
- **cached_network_image:** Görsellerin önbelleğe alınmasını ve verimli yüklenmesini sağlamak için.
- **url_launcher:** Uygulama içinden tarayıcı açarak URL'leri ziyaret etmek için.
- **flutter_cache_manager:** Özel önbellek yönetimi için.

## 🛠 Kurulum

Bu projeyi yerel makinenizde çalıştırmak için aşağıdaki adımları takip edebilirsiniz:

### Ön Koşullar

- [Flutter SDK](https://flutter.dev/docs/get-started/install) yüklü olmalı.
- Bir IDE (VS Code, Android Studio, vs.) kurulu olmalı.
- Gerekli Flutter eklentileri (Dart, Flutter) kurulmuş olmalı.

### Adımlar

  1. **Projeyi Klonlayın:**

   git clone https://github.com/kullanici-adiniz/turkiye-haberleri.git
   cd turkiye-haberleri
    
  2.	**Bağımlılıkları Yükleyin::**
      flutter pub get
	3.	**Platforma Özgü Yapılandırmaları Yapın:**

    • Android:
  	• android/app/src/main/AndroidManifest.xml dosyasını açın ve gerekli izinlerin (INTERNET) ekli olduğundan emin olun.
	  • iOS:
	  • ios/Runner/Info.plist dosyasını açın ve gerekli izinlerin (NSAppTransportSecurity) ekli olduğundan emin olun.

  4.	**Projeyi Temizleyin ve Yeniden Derleyin:**
      flutter clean
      flutter pub get
      flutter run

**Proje Yapısı**

turkiye-haberleri/
├── android/
├── ios/
├── lib/
│   ├── models/
│   │   └── news.dart
│   ├── pages/
│   │   ├── home_page.dart
│   │   ├── haber_detay_page.dart
│   │   └── full_screen_image.dart
│   ├── services/
│   │   └── api_service.dart
│   ├── widgets/
│   │   ├── category_selector.dart
│   │   └── haber_card.dart
│   └── main.dart
├── pubspec.yaml
└── README.md

🤝 Katkıda Bulunmak

Katkıda bulunmak isterseniz, lütfen CONTRIBUTING.md dosyasını inceleyin. Her türlü katkıya açığım!

📄 Lisans

Bu proje MIT Lisansı altında lisanslanmıştır. Daha fazla bilgi için LICENSE dosyasına bakabilirsiniz.

📬 İletişim

Herhangi bir sorunuz veya öneriniz olursa, gorkemoa35@gmail.com adresinden bana ulaşabilirsiniz.
