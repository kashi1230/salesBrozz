import 'package:data_table_plus/data_table_plus.dart';
import 'package:flutter/material.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/Button.dart';

class MyDistriButorsScreen extends StatefulWidget {
  @override
  _MyCustomerScreenState createState() => _MyCustomerScreenState();
}

class _MyCustomerScreenState extends State<MyDistriButorsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  List<Map<String, String>> customers = [];

  void addCustomer() {
    customers.add({
      'Name': nameController.text,
      'Contact Number': contactNumberController.text,
      'Type': typeController.text,
      'City': cityController.text,
    });
    // Clear text fields after adding customer
    nameController.clear();
    contactNumberController.clear();
    typeController.clear();
    cityController.clear();
    // Force rebuild to update table
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text('Add Customer'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: nameController,
                                decoration:
                                InputDecoration(labelText: 'Name'),
                              ),
                              TextField(
                                controller: contactNumberController,
                                decoration: InputDecoration(
                                    labelText: 'Contact Number'),
                              ),
                              TextField(
                                controller: typeController,
                                decoration:
                                InputDecoration(labelText: 'Type'),
                              ),
                              TextField(
                                controller: cityController,
                                decoration:
                                InputDecoration(labelText: 'City'),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  FButton(title: "Save",onpress: () {
                                    addCustomer();
                                    Navigator.of(context).pop();
                                  },),
                                  CancelButton(title: "Cancel",ontap: (){Navigator.of(context).pop();})
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.person_add, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(4),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.cyan,
                  ),
                ),
                Text(
                  "Add",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 30,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("My Distributors↓",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          ),
          SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              shape: LinearBorder(),
              color: Colors.white,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Contact Number')),
                  DataColumn(label: Text('Type')),
                  DataColumn(label: Text('City')),
                  DataColumn(label: Text('Action')),
                ],
                rows: customers
                    .map(
                      (customer) => DataRow(
                    cells: [
                      DataCell(Text(customer['Name'] ?? '')),
                      DataCell(Text(customer['Contact Number'] ?? '')),
                      DataCell(Text(customer['Type'] ?? '')),
                      DataCell(Text(customer['City'] ?? '')),
                      DataCell(
                          Container(
                              height: 30,
                              width: 90,
                              child: FButton(title: "Action",onpress: (){}))
                      ),
                    ],
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
