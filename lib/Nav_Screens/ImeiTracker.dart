import 'package:flutter/material.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/Button.dart';

class TrackingScreen extends StatefulWidget {
  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border:UnderlineInputBorder(),
                suffixIcon: Icon(Icons.document_scanner),
                label: Text("Search/scan for IMEI Tracker")
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _onTap(0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: _selectedIndex == 0 ? Colors.blue : Colors.transparent,
                    child: Text('All', style: TextStyle(color: _selectedIndex == 0 ? Colors.white : Colors.black)),
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTap(1),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: _selectedIndex == 1 ? Colors.blue : Colors.transparent,
                    child: Text('Activated', style: TextStyle(color: _selectedIndex == 1 ? Colors.white : Colors.black)),
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTap(2),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: _selectedIndex == 2 ? Colors.blue : Colors.transparent,
                    child: Text('Sell In', style: TextStyle(color: _selectedIndex == 2 ? Colors.white : Colors.black)),
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTap(3),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: _selectedIndex == 3 ? Colors.blue : Colors.transparent,
                    child: Text('Sell Out', style: TextStyle(color: _selectedIndex == 3 ? Colors.white : Colors.black)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildCard(),
                _buildCard(),
                _buildCard(),
                _buildCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return  Card(
      color: Colors.white,
      margin: EdgeInsets.all(2.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'IMEI: 6666666',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                FButton(title: "Move To Sell",onpress: (){})
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'Activity for IMEI: 666666',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sell In'),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text('Vivo Y21 (3/32gb) was purchased on:'),
                      ),
                      Text(
                        'Sat Jun 18,2022',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Purchase Invoice: ',
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                text: 'N/A',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'This Product is there in your Stock for : ',
                                style: TextStyle(fontWeight: FontWeight.normal,),
                              ),
                              TextSpan(
                                text: '639/days',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
