import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TravelHomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF9F3), // Hellbeige
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF30241B), // Dunkelbraun
          foregroundColor: Colors.white, // Textfarbe in der AppBar
        ),
        cardTheme: const CardThemeData(
          color: Colors.white,
          shadowColor: Colors.black12,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
    );
  }
}
