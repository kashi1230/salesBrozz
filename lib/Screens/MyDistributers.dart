import 'package:flutter/material.dart';

class Customer {
  final String name;
  final String contactNumber;
  final String type;
  final String city;

  Customer({
    required this.name,
    required this.contactNumber,
    required this.type,
    required this.city,
  });
}

class DistriButors extends StatefulWidget {
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<DistriButors> {
  List<Customer> customers = [
    Customer(name: 'John Doe', contactNumber: '1234567890', type: 'Regular', city: 'New York'),
    Customer(name: 'Alice Smith', contactNumber: '9876543210', type: 'VIP', city: 'Los Angeles'),
    Customer(name: 'Bob Johnson', contactNumber: '4567890123', type: 'Regular', city: 'Chicago'),
  ];

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    List<Customer> filteredCustomers = customers.where((customer) {
      return customer.name.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.person_add, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(4),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.cyan,
                ),
              ),
              Text("Add",style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(width: 60,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: 200,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    labelText: 'Search',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Card(
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
                DataColumn(label: Text('Contact Number',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
                DataColumn(label: Text('Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
                DataColumn(label: Text('City',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
                DataColumn(label: Text('Action',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
              ],
              rows: filteredCustomers.map((customer) {
                return DataRow(cells: [
                  DataCell(Text(customer.name)),
                  DataCell(Text(customer.contactNumber)),
                  DataCell(Text(customer.type)),
                  DataCell(Text(customer.city)),
                  DataCell(
                    DropdownButton<String>(
                      borderRadius:BorderRadius.circular(12),
                      items: <String>['Edit', 'Delete'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Handle dropdown button selection
                      },
                      dropdownColor: Colors.green,
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                      hint: Text('Action',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
