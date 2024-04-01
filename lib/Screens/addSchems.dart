
import 'package:flutter/material.dart';

class Addscheme extends StatelessWidget {
  const Addscheme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('2024'),
                Text('March This Week Today'),
                SizedBox(height: 16.0),
                Text('Search Brand...'),
                SizedBox(height: 16.0),
                Text('Choose a date range'),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Scheme Name',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Brand',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Incentive Type',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Target Type',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Payout Type',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Period From',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Period To',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('View Products'),
                ),
                SizedBox(height: 16.0),
                Text(
                  'No Schemes Available for Selected Period. Please Add a New Scheme or select an alternate period.',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add New Scheme'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}