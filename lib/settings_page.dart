import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Your DashboardPage file
import 'profile_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 2; // Assuming Settings is the third item in the nav bar
  bool _notificationsEnabled = true;
  double _dailyBudget = 50.0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const DashboardPage()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const ProfilePage()));
        break;
    // No action if the Settings button (index 2) is tapped since we're already on the Settings page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () {
              // Placeholder for save settings functionality
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: const Text('Enable Notifications', style: TextStyle(color: Colors.white)),
                  value: _notificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  activeColor: Colors.lightGreen,
                ),
                ListTile(
                  title: const Text('Daily Budget', style: TextStyle(color: Colors.white)),
                  subtitle: Slider(
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _dailyBudget.toString(),
                    value: _dailyBudget,
                    onChanged: (double value) {
                      setState(() {
                        _dailyBudget = value;
                      });
                    },
                    activeColor: Colors.lightGreen,
                    inactiveColor: Colors.lightGreen[100],
                  ),
                  trailing: Text('\$${_dailyBudget.toStringAsFixed(0)}', style: const TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Background color
                  ),
                  onPressed: () => _logOut(context),
                  child: const Text('Log Out'),
                ),
                // Add other settings widgets here...
              ],
            ),
          ),
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _logOut(BuildContext context) {
    // Implement your log out logic here, such as clearing user data or navigating to a login screen.
    Navigator.pop(context);
  }
}
