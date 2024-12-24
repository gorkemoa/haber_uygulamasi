import 'package:flutter/material.dart';

import 'pages/news_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pluginlerin başlatılması için gerekli
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Tema ayarları
  final ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    hintColor: Colors.blueAccent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 16.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Türkiye Haberleri',
      theme: theme,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}