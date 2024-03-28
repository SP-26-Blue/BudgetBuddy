import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Ensure it covers the width of the screen
      height: MediaQuery.of(context).size.height, // Ensure it covers the height of the screen
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/home.jpg'),
          fit: BoxFit.cover, // Ensure the image covers the entire container
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/100'),
            ),
            const SizedBox(height: 10),
            const Text(
              'User Name',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Adjust text color for visibility
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.white.withOpacity(0.8), // Make card slightly transparent
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Budget Goals',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Monthly Savings Goal: \$500'),
                    Text('Monthly Expense Limit: \$1500'),
                    Text('Investment Goal: \$200 monthly'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Link to Bank Account'),
                    content: const Text('This feature will be implemented in the future using the Plaid API.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.link),
              label: const Text('Link to Bank Account'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
