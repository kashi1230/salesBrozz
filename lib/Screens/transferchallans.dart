import 'package:flutter/material.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/Button.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  void _saveAndSend() {
    // Save and send logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Saved successfully'),
      ),
    );
  }
  String selectedItem = 'Item 1'; // Selected dropdown item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField(
                value: selectedItem,
                onChanged: (newValue) {
                  setState(() {
                    selectedItem = newValue.toString();
                  });
                },
                items: ['Item 1', 'Item 2', 'Item 3']
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Select Branch',
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Challan Number'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Challan Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () {
                  // Implement date range selection logic
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField(
                value: selectedItem,
                onChanged: (newValue) {
                  setState(() {
                    selectedItem = newValue.toString();
                  });
                },
                items: ['Item 1', 'Item 2', 'Item 3']
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'City',
                ),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField(
                value: selectedItem,
                onChanged: (newValue) {
                  setState(() {
                    selectedItem = newValue.toString();
                  });
                },
                items: ['Item 1', 'Item 2', 'Item 3']
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'State',
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Pincode'),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField(
                value: selectedItem,
                onChanged: (newValue) {
                  setState(() {
                    selectedItem = newValue.toString();
                  });
                },
                items: ['Item 1', 'Item 2', 'Item 3']
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'country',
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HButton(text: "cancel",icon: Icon(Icons.cancel)),
                  SizedBox(width: 10,),
                  FButton(title: "Save",onpress: (){_saveAndSend();}),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
