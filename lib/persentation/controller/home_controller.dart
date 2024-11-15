import 'package:flutter/material.dart';
import '../pages/welcome.dart'; 
import '../pages/popular_animals_page.dart';

class HomeController {
  final BuildContext context;

  HomeController(this.context);

  // Fungsi untuk navigasi ke WelcomePage
  void goToWelcomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  // Fungsi untuk navigasi ke PopularAnimalsPage
  void goToPopularAnimalsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PopularAnimalsPage()),
    );
  }
}
