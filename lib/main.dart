import 'package:budget/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DashboardDataProvider.dart'; // Make sure this import path is correct
import 'PlaidService.dart'; // Import your PlaidService class
import 'home_page.dart';
import 'signup_page.dart';
import 'login_page.dart';
import 'settings_page.dart';
import 'dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create an instance of PlaidService
    final plaidService = PlaidService(clientId: '65f21828e0f17c001cf3c258',
        secret: 'dbee10c2033d67cc3c76ac3ae79104');

    return MultiProvider(
      providers: [
        // Provide the instance of PlaidService to DashboardDataProvider
        ChangeNotifierProvider(
          create: (context) => DashboardDataProvider(plaidService: plaidService),
        ),
      ],
      child: MaterialApp(
        title: 'BudgetBudd - Financial Companion',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => const HomePage(),
          '/signup': (context) => const SignUpPage(),
          '/login': (context) => const LoginPage(),
          '/settings': (context) => SettingsPage(),
          '/dashboard': (context) => const DashboardPage(),
          '/profile': (context) => const ProfilePage()
        },
      ),
    );
  }
}
