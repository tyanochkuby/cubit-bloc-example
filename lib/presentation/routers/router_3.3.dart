import 'package:bloc_example/presentation/screens/settings_page_3.3.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return null;
    }
  }
}
