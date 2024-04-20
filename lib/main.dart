import 'package:flutter/material.dart';
import 'package:mdev1005_assignment3/routes/Routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Entry point of the application
void main() async {
  // Ensure that the app bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase app with default options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(const MyApp());
}

// MyApp class is the root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp widget configures the root of the application
    return MaterialApp(
      title: 'MDEV1005_Assignment3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
          ),
        ),
      ),
      // Set the initial route to the greeting page
      initialRoute: Routes.greeting,
      // Define the route generator for the application
      onGenerateRoute: Routes.generateRoute,
    );
  }
}