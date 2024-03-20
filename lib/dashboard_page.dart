import 'package:flutter/material.dart';
import 'plaid_service.dart'; // Make sure to have your PlaidService class in the correct location

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PlaidService _plaidService = PlaidService();
  List<Map<String, dynamic>> _transactions = [];

  @override
  void initState() {
    super.initState();
    _fetchFinancialData();
  }

  Future<void> _fetchFinancialData() async {
    // This simulates fetching transactions. You'll replace this with your actual Plaid integration.
    var transactions = await _plaidService.fetchTransactions('fake_access_token');
    setState(() {
      _transactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: ListView(
        children: [
          _buildBalanceCard(),
          _buildSavingsOverview(),
          _buildFinancialInsights(),
          _buildBudgetSection(),
          _buildTransactionList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    // Placeholder for balance card
    return const Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Current Balance', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('USD 10,000.00', style: TextStyle(fontSize: 24)),
            // Placeholder for chart
            SizedBox(height: 150, child: Placeholder()),
          ],
        ),
      ),
    );
  }

  Widget _buildSavingsOverview() {
    // Placeholder for savings overview
    return const Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Savings Overview', style: TextStyle(fontWeight: FontWeight.bold)),
            // Placeholder for chart
            SizedBox(height: 150, child: Placeholder()),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialInsights() {
    // Placeholder for financial insights
    return const Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Financial Insights', style: TextStyle(fontWeight: FontWeight.bold)),
            // Placeholder for chart
            SizedBox(height: 200, child: Placeholder()),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetSection() {
    // Placeholder for budget section
    return const Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Budget', style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(
              title: Text('Travel Plans'),
              trailing: Text('62% Progress'),
            ),
            ListTile(
              title: Text('Spending'),
              trailing: Text('60% Grocery'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          const ListTile(
            title: Text('Transactions', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ..._transactions.map((transaction) => ListTile(
            leading: const Icon(Icons.move_to_inbox),
            title: Text(transaction['name']),
            subtitle: Text(transaction['category']),
            trailing: Text(transaction['amount']),
          )),
        ],
      ),
    );
  }
}
