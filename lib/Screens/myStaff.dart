import 'package:flutter/material.dart';


class Staff {
  final String name;
  final String contactNumber;
  final String email;
  final String city;
  final String state;
  final String pincode;
  final String permissions;

  Staff({
    required this.name,
    required this.contactNumber,
    required this.email,
    required this.city,
    required this.state,
    required this.pincode,
    required this.permissions,
  });
}


class StaffManagementScreen extends StatefulWidget {
  @override
  _StaffManagementScreenState createState() => _StaffManagementScreenState();
}

class _StaffManagementScreenState extends State<StaffManagementScreen> {
  List<Staff> staffList = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController permissionsController = TextEditingController();

  void _addStaff() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        title: Center(child: Text('ADD STAFF',style: TextStyle(color: Colors.black,),)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: contactNumberController,
                decoration: InputDecoration(labelText: 'Contact Number'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: cityController,
                decoration: InputDecoration(labelText: 'City'),
              ),
              TextField(
                controller: stateController,
                decoration: InputDecoration(labelText: 'State'),
              ),
              TextField(
                controller: pincodeController,
                decoration: InputDecoration(labelText: 'Pincode'),
              ),
              TextField(
                controller: permissionsController,
                decoration: InputDecoration(labelText: 'Permissions'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            onPressed: () {
              setState(() {
                Staff staff = Staff(
                  name: nameController.text,
                  contactNumber: contactNumberController.text,
                  email: emailController.text,
                  city: cityController.text,
                  state: stateController.text,
                  pincode: pincodeController.text,
                  permissions: permissionsController.text,
                );
                staffList.add(staff);
                nameController.clear();
                contactNumberController.clear();
                emailController.clear();
                cityController.clear();
                stateController.clear();
                pincodeController.clear();
                permissionsController.clear();
              });
              Navigator.pop(context);
            },
            child: Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.blue
                  ),
                  onPressed: _addStaff,
                  child: Text('Add Staff',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("My Staff ↓",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              color: Colors.white,
              shape: LinearBorder(),
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Contact Number')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('City')),
                  DataColumn(label: Text('State')),
                  DataColumn(label: Text('Pincode')),
                  DataColumn(label: Text('Permissions')),
                ],
                rows: staffList.map((staff) {
                  return DataRow(
                    cells: [
                      DataCell(Text(staff.name)),
                      DataCell(Text(staff.contactNumber)),
                      DataCell(Text(staff.email)),
                      DataCell(Text(staff.city)),
                      DataCell(Text(staff.state)),
                      DataCell(Text(staff.pincode)),
                      DataCell(Text(staff.permissions)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}