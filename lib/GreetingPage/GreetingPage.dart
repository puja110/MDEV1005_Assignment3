import 'package:flutter/material.dart';
import 'package:mdev1005_assignment3/routes/Routes.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center( // Center widget to center the column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Greeting message
            const Text(
              'Welcome to Our App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Center the text
            ),
            const SizedBox(height: 20),
            // Image
            Image.asset(
              'assets/images/welcome_image.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            // Button to navigate to home page
            ElevatedButton(
              onPressed: () {
                // Navigate to home page
                Routes.navigateTo(context, Routes.home);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set button color to blue
              ),
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
