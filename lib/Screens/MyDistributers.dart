import 'package:flutter/material.dart';

class DistributerScreen extends StatelessWidget {
  final String name = 'Ajay Chauhan';
  final String contactNumber = '9893072833';
  final String city = 'Shivpuri';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('My Distributor'),
            Row(
              children: [
                Text("Add Distributor",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ElevatedButton(
                  onPressed: () {},
                  // icon of the button
                  child: Icon(Icons.add, color: Colors.white),
                  // styling the button
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8),
                    // Button color
                    backgroundColor: Colors.black,
                    // Splash color
                    foregroundColor: Colors.cyan,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              shape: LinearBorder(),
              color: Colors.white38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Contact Number',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'City',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Action',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}

