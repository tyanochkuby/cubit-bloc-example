import 'package:bloc_example/presentation/screens/home_page_3.2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                const HomePage(title: 'Home Page', color: Colors.teal));
      default:
        return null;
    }
  }
}
