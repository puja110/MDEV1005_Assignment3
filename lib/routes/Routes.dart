import 'package:flutter/material.dart';
import 'package:mdev1005_assignment3/GreetingPage/GreetingPage.dart';
import 'package:mdev1005_assignment3/home/HomePageScreen.dart';
import 'package:mdev1005_assignment3/home/Weather/WeatherScreen.dart';
import 'package:mdev1005_assignment3/home/calculator/CalculatorScreen.dart';
import 'package:mdev1005_assignment3/home/notes/NotesScreen.dart';
import 'package:mdev1005_assignment3/login/LoginScreen.dart';
import 'package:mdev1005_assignment3/register/RegisterScreen.dart';

class Routes {
  static const String greeting = '/greeting';
  static const String home = '/home';
  static const String calculator = '/calculator';
  static const String notes = '/notes';
  static const String weather = '/weather';
  static const String login = '/';
  static const String register = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case greeting:
        return MaterialPageRoute(builder: (_) => const GreetingPage());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case calculator:
        return MaterialPageRoute(builder: (_) => const CalculatorScreen());
      case notes:
        return MaterialPageRoute(builder: (_) => const NotesScreen());
      case weather:
        return MaterialPageRoute(builder: (_) => const WeatherScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }

  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}