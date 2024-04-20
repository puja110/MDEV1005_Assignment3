import 'package:flutter/material.dart';
import 'package:mdev1005_assignment3/routes/Routes.dart';
import 'package:mdev1005_assignment3/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to calculator screen
                Routes.navigateTo(context, Routes.calculator);
              },
              child: const Text('Calculator'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to notes screen
                Routes.navigateTo(context, Routes.notes);
              },
              child: const Text('Notes'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to weather screen
                Routes.navigateTo(context, Routes.weather);
              },
              child: const Text('Weather Forecast'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                await _authService.signOut();
                // Navigate to login screen
                Routes.navigateTo(context, Routes.greeting);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}