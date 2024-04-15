import 'package:flutter/material.dart';
import 'package:mdev1005_assignment3/home/HomePageScreen.dart';
import 'package:mdev1005_assignment3/home/calculator/CalculatorScreen.dart';
import 'package:mdev1005_assignment3/home/notes/NotesScreen.dart';

class Routes {
  static const String home = '/';
  static const String calculator = '/calculator';
  static const String notes = '/notes';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        //helps navigate to home screen which is default screen
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case calculator:
        //helps navigate to calculator screen
        return MaterialPageRoute(builder: (_) => const CalculatorScreen());
      case notes:
        //helps navigate to notes screen
        return MaterialPageRoute(builder: (_) => const NotesScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }

  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
