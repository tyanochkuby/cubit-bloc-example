import 'package:flutter/material.dart';
import 'package:bloc_example/presentation/screens/home_page_4.0.dart';

class AppRouter4 {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage4());
      default:
        return null;
    }
  }
}
