import 'dart:async';
import 'dart:convert';

class PlaidService {
  // Your Plaid API credentials
  final String clientId = 'YOUR_CLIENT_ID';
  final String secret = 'YOUR_SECRET';
  // Use the sandbox URL for testing. Switch to the production URL in a live environment.
  final String plaidUrl = 'https://sandbox.plaid.com';

  get awaithttp => null;

  // Method to get a link token from Plaid. This is necessary for initializing Plaid Link.
  Future<String?> getLinkToken() async {
    try {
      var url = Uri.parse('$plaidUrl/link/token/create');
      var response = awaithttp.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'client_id': '65f21828e0f17c001cf3c258',
            'secret': 'e2a676d9c6448b99719310f2faca24',
            'client_name': 'Budget Buddy',
            'country_codes': ['US'],
            'language': 'en',
            'user': {
              // A unique identifier for the user
              'client_user_id': 'unique_user_id',
            },
            'products': ['transactions']
          }));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['link_token'];
      } else {
        print('Failed to get link token: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception when getting link token: $e');
      return null;
    }
  }

  // Simulated method for fetching transactions. Replace with real implementation for live use.
  Future<List<Map<String, dynamic>>> fetchTransactions(String accessToken) async {
    // Simulating a delay for async operation
    await Future.delayed(const Duration(seconds: 1));

    // Mock data to simulate fetched transactions
    return [
      {
        'name': 'Local Eats',
        'category': 'Dining Out',
        'amount': '-18.96',
      },
      {
        'name': 'Home Essentials',
        'category': 'Household',
        'amount': '-92.50',
      },
    ];
  }
}
