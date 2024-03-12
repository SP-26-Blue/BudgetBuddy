import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Current Balance', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('USD 10,000.00', style: TextStyle(fontSize: 24)),
            Container(height: 150, color: Colors.grey[300]), // Placeholder for chart
          ],
        ),
      ),
    );
  }

  Widget _buildSavingsOverview() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Savings Overview', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(height: 150, color: Colors.grey[300]), // Placeholder for chart
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialInsights() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Financial Insights', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(height: 200, color: Colors.grey[300]), // Placeholder for chart
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetSection() {
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
    return const Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            title: Text('Transactions', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('Local Eats'),
            subtitle: Text('Dining Out'),
            trailing: Text('-18.96'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Essentials'),
            subtitle: Text('Household'),
            trailing: Text('-92.50'),
          ),
          // More transactions can be added here
        ],
      ),
    );
  }
}
