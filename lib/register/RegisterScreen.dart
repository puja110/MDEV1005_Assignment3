import 'package:flutter/material.dart';
import 'package:mdev1005_assignment3/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class RegisterScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                if (email.isNotEmpty && password.isNotEmpty) {
                  User? user = await _authService.registerWithEmailAndPassword(email, password);
                  if (user != null) {
                    // Registration successful, navigate to home page
                    Navigator.pushNamed(context, '/home');
                  } else {
                    // Registration failed, show error dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Failed to register. Please try again.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  // Show error dialog if email or password is empty
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Please enter email and password.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // Navigate to login screen
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Already have an account? Sign in here.'),
            ),
          ],
        ),
      ),
    );
  }
}