

import 'package:flutter/material.dart';

class ImEi extends StatelessWidget {
  List<String> nameList =[
    "All",
    "Activated",
    "Sell-Out",
    "Sell-in"
  ];
  ImEi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMEI Tracker'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Scan/enter IMEIs to track',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {
                        // Add your scan action here
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.separated(
              itemCount: 2,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ListTile(
                    title: Text('IMEI: 6666666666'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Activated'),
                        Text('Sell In'),
                        Text('VIVO Y11 (3/32GB) was purchased on Sat, Jun 18, 2022.'),
                        Text('This product is there in your stocks for 639 Days'),
                        ElevatedButton(onPressed: (){}, child: Text("Move Out"))
                      ],
                    ),
                  );
                } else {
                  return ListTile(
                    title: Text('IMEI: 44444444444'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sell In'),
                        Text('XIAOMI POCO M2 Pro 4/64GB was purchased on Sat, Jun 18, 2022.'),
                        Text('This product is there in your stocks for 639 Days'),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}