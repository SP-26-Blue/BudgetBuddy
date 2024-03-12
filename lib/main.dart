import 'package:flutter/material.dart';
import 'home_page.dart'; // Start Page
import 'signup_page.dart'; // Signup Page
import 'login_page.dart'; // Login Page
import 'settings_page.dart'; // Settings Page
import 'dashboard_page.dart'; // Dashboard


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BudgetBudd - Financial Companion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Define the routes
      routes: {
        '/': (context) => const HomePage(),
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
        '/settings': (context) => const SettingsPage(),
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}
