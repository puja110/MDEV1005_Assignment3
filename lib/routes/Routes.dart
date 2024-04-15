import 'package:flutter/material.dart';
import 'package:mdev1005_assignment3/home/HomePageScreen.dart';
import 'package:mdev1005_assignment3/home/calculator/CalculatorScreen.dart';

class Routes {
  static const String home = '/';
  static const String calculator = '/calculator';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case calculator:
        return MaterialPageRoute(builder: (_) => const CalculatorScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }

  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
