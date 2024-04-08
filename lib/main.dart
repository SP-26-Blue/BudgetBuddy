import 'dart:io';

import 'package:flutter/material.dart';
import 'home_page.dart'; // Start Page
import 'signup_page.dart'; // Signup Page
import 'login_page.dart'; // Login Page
import 'settings_page.dart'; // Settings Page
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard_page.dart'; // Dashboard


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB1hingZz4JaD-2p97X7Z46Tqa5bs9egbc",
      appId: "1:98202596877:android:ff8a259caf5ef92f010744",
      messagingSenderId: "98202596877",
      projectId: "budgetbuddy-501f5",
    ),
  );
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BudgetBuddy - Financial Companion',
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