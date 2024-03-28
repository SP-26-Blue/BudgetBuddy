import 'package:http/http.dart' as http;
import 'dart:convert';

class PlaidService {
  final String clientId;
  final String secret;

  PlaidService({required this.clientId, required this.secret});

  // Fetch transactions
  Future<dynamic> fetchTransactions(String accessToken) async {
    final url = Uri.parse('https://sandbox.plaid.com/transactions/get');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'client_id': clientId,
          'secret': secret,
          'access_token': accessToken,
          'start_date': '2020-01-01',
          'end_date': '2020-02-01',
        }));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  // Fetch account balances
  Future<dynamic> fetchAccountBalances(String accessToken) async {
    final url = Uri.parse('https://sandbox.plaid.com/accounts/balance/get');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'client_id': clientId,
          'secret': secret,
          'access_token': accessToken,
        }));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load account balances');
    }
  }

  // Create a Link Token for initializing Plaid Link
  Future<dynamic> createLinkToken() async {
    final url = Uri.parse('https://sandbox.plaid.com/link/token/create');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'client_id': clientId,
          'secret': secret,
          'client_name': "Your App Name",
          'country_codes': ['US'],
          'language': 'en',
          'user': {
            // This should be a unique ID for your user
            'client_user_id': 'unique-user-id',
          },
          'products': ['transactions'],
        }));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create link token');
    }
  }

// Add more methods as needed for fetching balances, income, etc.
}
