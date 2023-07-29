import 'package:bloc_example/presentation/screens/home_page.dart';
import 'package:bloc_example/presentation/screens/second%20screen.dart';
import 'package:bloc_example/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                const HomePage(title: 'Home Page', color: Colors.teal));
      case '/2':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                title: "Second Page", color: Colors.lightGreen));
      case '/3':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                title: 'Third Page', color: Colors.amberAccent));
      default:
        return null;
    }
  }
}
