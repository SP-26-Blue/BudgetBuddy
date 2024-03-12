import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Spacer(),
              const FlutterLogo(size: 100), // Placeholder for your logo or image
              const SizedBox(height: 24),
              const Text(
                'UPGRADE PLAN',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'BudgetBudd\nFinancial Companion',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Spacer(),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  // Navigate to the LoginPage
                  Navigator.pushNamed(context, '/login');
                },
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                child: const Text('Register'),
                onPressed: () {
                  // Navigate to the SignUpPage
                  Navigator.pushNamed(context, '/signup');
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
