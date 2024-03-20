import 'package:flutter/material.dart';
// Import PlaidService if you plan to initiate the Plaid Link process from this page
// import 'plaid_service.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  // PlaidService plaidService = PlaidService();
  bool _isLoading = false;

  void _linkBankAccount() {
    setState(() {
      _isLoading = true;
    });

    // Simulate an API call or the Plaid Link process
    Future.delayed(const Duration(seconds: 2), () {
      // This is where you would normally integrate the Plaid Link process
      // For example, using plaidService.getLinkToken() to start the process
      setState(() {
        _isLoading = false;
      });
      // Show a mock success dialog for this example
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Link Bank Account'),
          content: const Text('Your bank account has been successfully linked.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Link Your Bank Account',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Use Plaid to securely link your bank account for seamless budget tracking.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isLoading ? null : _linkBankAccount,
              child: _isLoading
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
                  : const Text('Link Bank Account'),
            ),
          ],
        ),
      ),
    );
  }
}
