import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'profile_page.dart'; // Make sure this is pointing to the correct file
import 'settings_page.dart'; // Assuming this is your SettingsPage
import 'transaction_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          BalanceCard(),
          SizedBox(height: 30),
          SavingsOverviewCard(),
          SizedBox(height: 10),
          ExpensePieChart(),
          TransactionHistoryCard(transactions: [
            {'name': 'Food', 'amount': '-\$10.00'},
            {'name': 'Rent', 'amount': '-\$800.00'},
            {'name': 'Groceries', 'amount': '-\$50.00'},
          ]),
          SizedBox(height: 10),
          GoalsCard(),
        ],
      ),
    ),
    const ProfilePage(),
    // SettingsPage is indirectly referenced here and navigated to through _onItemTapped
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
    } else if (index == 3) { // Check for index 3, which corresponds to the new item
      Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionPage()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Transactions',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.orange, // Set the unselected item color here
        onTap: _onItemTapped,
      ),

    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.lightBlueAccent,
      elevation: 5,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              'Current Balance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              '\$20.00',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Divider(color: Colors.white),
            Icon(Icons.arrow_upward, color: Colors.white),
            Text('Income', style: TextStyle(color: Colors.white)),
            Text('\$100.00', style: TextStyle(color: Colors.white)),
            SizedBox(height: 50),
            Icon(Icons.arrow_downward, color: Colors.white),
            Text('Expenses', style: TextStyle(color: Colors.white)),
            Text('\$80.00', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class SavingsOverviewCard extends StatelessWidget {
  const SavingsOverviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.lightBlue.shade300, Colors.lightBlue.shade600],
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Savings Overview',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            '\$1700.48',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class ExpensePieChart extends StatelessWidget {
  const ExpensePieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 200,
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: Colors.red,
                value: 40,
                title: 'Rent',
                radius: 50,
                titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              PieChartSectionData(
                color: Colors.green,
                value: 30,
                title: 'Food',
                radius: 50,
                titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              PieChartSectionData(
                color: Colors.blue,
                value: 30,
                title: 'Groceries',
                radius: 50,
                titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
            sectionsSpace: 0,
            centerSpaceRadius: 40,
          ),
        ),
      ),
    );
  }
}

class TransactionHistoryCard extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const TransactionHistoryCard({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[100],
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Transaction History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ...transactions.map((transaction) => ListTile(
              title: Text(transaction['name']),
              trailing: Text(
                transaction['amount'],
                style: TextStyle(
                  color: transaction['amount'].startsWith('-') ? Colors.red : Colors.green,
                ),
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}

class GoalsCard extends StatelessWidget {
  const GoalsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> goals = [
      {'name': 'Savings', 'current': 350, 'total': 1000},
      {'name': 'Tuition', 'current': 575, 'total': 1500},
    ];

    return Card(
      color: Colors.lightGreenAccent[100],
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Goals',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ...goals.map((goal) {
              double progress = goal['current'] / goal['total'];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${goal['name']}: \$${goal['current']} of \$${goal['total']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
