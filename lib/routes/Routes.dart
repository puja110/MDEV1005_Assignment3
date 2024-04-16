import 'package:flutter/material.dart';
import 'package:mdev1005_assignment3/GreetingPage/GreetingPage.dart';
import 'package:mdev1005_assignment3/home/HomePageScreen.dart';
import 'package:mdev1005_assignment3/home/Weather/WeatherScreen.dart';
import 'package:mdev1005_assignment3/home/calculator/CalculatorScreen.dart';
import 'package:mdev1005_assignment3/home/notes/NotesScreen.dart';

class Routes {
  static const String greeting = '/';
  static const String home = '/home';
  static const String calculator = '/calculator';
  static const String notes = '/notes';
  static const String weather = '/weather';

  

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case greeting:
        // Navigate to the greeting page
        return MaterialPageRoute(builder: (_) => const GreetingPage());
      case home:
        // Navigate to the home page
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case calculator:
        //helps navigate to calculator screen
        return MaterialPageRoute(builder: (_) => const CalculatorScreen());
      case notes:
        //helps navigate to notes screen
        return MaterialPageRoute(builder: (_) => const NotesScreen());
      case weather:
        //helps navigate to notes screen
        return MaterialPageRoute(builder: (_) => const WeatherScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }

  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
