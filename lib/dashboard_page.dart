import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  _DashboardPage createState() => _DashboardPage();
}
class _DashboardPage extends State<DashboardPage> {
  int _selectedIndex = 0;

  // Update the array if you have more pages
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
          // Add more content for the first page here
        ],
      ),
    ),
    const Center(child: Text('Home')),
    // Previously 'Settings' page content
    const Center(child: Text('Settings')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page with Custom Card'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
            AssetImage("assets/home.jpg"), // Make sure the path is correct
            fit: BoxFit.cover,
          ),
        ),
        child: _pages[
        _selectedIndex], // Display the page by selected index wrapped in the background
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.lightBlueAccent, // Adjust the color to match the image
      elevation: 5,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              'Current Balance',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              '\$ 20.00',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.arrow_upward, color: Colors.white),
                    Text('Income', style: TextStyle(color: Colors.white)),
                    Text('\$ 100.00', style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: VerticalDivider(color: Colors.white),
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.arrow_downward, color: Colors.white),
                    Text('Expenses', style: TextStyle(color: Colors.white)),
                    Text('\$ 80.00', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class SavingsOverviewCard extends StatelessWidget {
  const SavingsOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240, // Set a fixed height for the entire container
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue.shade300,
            Colors.lightBlue.shade600,
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Savings Overview',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '\$1,700.48',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                  barTouchData: BarTouchData(

                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueGrey,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.y.round().toString(),
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            // You can add more text spans if needed
                          ],
                        );
                      },
                      tooltipPadding: const EdgeInsets.all(6), // Adjust the padding inside the tooltip for a smaller box
                      tooltipMargin: 8, // The distance of the tooltip from the touched spot
                      tooltipRoundedRadius: 4, // The corner radius of the tooltip background
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                    ),
                    enabled: true,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) => const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                      margin: 10,
                      getTitles: (double value) {
                        // You can dynamically add titles based on the value or index of the bar
                        switch (value.toInt()) {
                          case 0:
                            return 'M';
                          case 1:
                            return 'T';
                          case 2:
                            return 'W';
                          case 3:
                            return 'T';
                          case 4:
                            return 'F';
                          case 5:
                            return 'S';
                          case 6:
                            return 'S';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(showTitles: false), // Hide left titles
                  ),
                  borderData: FlBorderData(
                    show: false, // Hide the border
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(y: 8, colors: [Colors.lightBlueAccent], width: 16),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(y: 10, colors: [Colors.lightBlueAccent], width: 16),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(y: 14, colors: [Colors.lightBlueAccent], width: 16),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(y: 15, colors: [Colors.lightBlueAccent], width: 16),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(y: 13, colors: [Colors.lightBlueAccent], width: 16),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 5,
                      barRods: [
                        BarChartRodData(y: 10, colors: [Colors.lightBlueAccent], width: 16),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 6,
                      barRods: [
                        BarChartRodData(y: 18, colors: [Colors.lightBlueAccent], width: 16),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                  ],

                  gridData: FlGridData(
                    show: false, // Turn off grid lines
                  ),
                ),
              )
          )

        ],
      ),
    );
  }
}
class ExpensePieChart extends StatelessWidget {
  const ExpensePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent, // Adjust the color to match the image
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height:
        200, // Define a height for the entire Row to avoid infinite height issues
        child: Row(
          children: [
            Expanded(
              flex:
              3, // Adjust flex ratio to control size of pie chart vs info list
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.blue,
                      value: 30,
                      title: '30%',
                      radius: 50,
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      value: 20,
                      title: '20%',
                      radius: 50,
                    ),
                    PieChartSectionData(
                      color: Colors.orange,
                      value: 15,
                      title: '15%',
                      radius: 50,
                    ),
                    // Add more sections as needed
                  ],
                  sectionsSpace: 0,
                  centerSpaceRadius: 10,
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
            const Expanded(
              flex: 2, // Adjust flex ratio as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Groceries: 30%',
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  Text('Clothes: 20%',
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  Text('Maintenance: 15%',
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  // Add more items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});
//

