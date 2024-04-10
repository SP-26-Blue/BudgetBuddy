import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Budget App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TransactionPage(),
    );
  }
}

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const GoalInfoCard(),
            SpendingInfoCard(),
            const TransactionsBox(),
          ],
        ),
      ),
    );
  }
}

class GoalInfoCard extends StatelessWidget {
  const GoalInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('Goal'),
        subtitle: Text('Travel Plan'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              '23%',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Only \$3,145.67 left to go!')
          ],
        ),
      ),
    );
  }
}

class SpendingInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text('Spending', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 10),
            const SpendingProgressBar(label: 'Grocery', percentage: 57),
            const SpendingProgressBar(label: 'Retail', percentage: 30),
            const SpendingProgressBar(label: 'Withdrawal', percentage: 13),
          ],
        ),
      ),
    );
  }
}

class TransactionsBox extends StatelessWidget {
  const TransactionsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TransactionCategory(title: 'Transactions', seeAllEnabled: true),
          TransactionItem(
            iconData: Icons.restaurant,
            title: 'Dining Out',
            amount: '-\$24.56',
          ),
          Divider(),
          TransactionItem(
            iconData: Icons.shopping_cart,
            title: 'Online Purchase',
            amount: '-\$24.56',
          ),
          Divider(),
          TransactionItem(
            iconData: Icons.account_balance_wallet,
            title: 'Transfer',
            amount: '+\$50.00',
          ),
        ],
      ),
    );
  }
}

class TransactionCategory extends StatelessWidget {
  final String title;
  final bool seeAllEnabled;

  const TransactionCategory({super.key, required this.title, this.seeAllEnabled = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          seeAllEnabled
              ? TextButton(
              onPressed: () {
                // Implement 'View All' functionality
              },
              child: const Text('View all'))
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String amount;

  const TransactionItem({super.key, required this.iconData, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      trailing: Text(
        amount,
        style: TextStyle(
          color: amount.startsWith('-') ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SpendingProgressBar extends StatelessWidget {
  final String label;
  final int percentage;

  const SpendingProgressBar({super.key, required this.label, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Expanded(flex: 3, child: Text(label)),
          Expanded(
            flex: 7,
            child: LinearProgressIndicator(
              value: percentage / 100.0,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('$percentage%'),
          ),
        ],
      ),
    );
  }
}
