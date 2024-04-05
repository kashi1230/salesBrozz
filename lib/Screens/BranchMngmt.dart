import 'package:flutter/material.dart';

class Branch {
  final String branchName;
  final String contactNumber;
  final String stock;

  Branch({
    required this.branchName,
    required this.contactNumber,
    required this.stock,
  });
}

class BranchManagementScreen extends StatefulWidget {
  @override
  _BranchManagementScreenState createState() => _BranchManagementScreenState();
}

class _BranchManagementScreenState extends State<BranchManagementScreen> {
  List<Branch> branchList = [];

  TextEditingController branchNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  void _addBranch() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Branch'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: branchNameController,
                decoration: InputDecoration(labelText: 'Branch Name'),
              ),
              TextField(
                controller: contactNumberController,
                decoration: InputDecoration(labelText: 'Contact Number'),
              ),
              TextField(
                controller: stockController,
                decoration: InputDecoration(labelText: 'Stock'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                Branch branch = Branch(
                  branchName: branchNameController.text,
                  contactNumber: contactNumberController.text,
                  stock: stockController.text,
                );
                branchList.add(branch);
                branchNameController.clear();
                contactNumberController.clear();
                stockController.clear();
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _deleteBranch(int index) {
    setState(() {
      branchList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15,left: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                  ),
                  onPressed: _addBranch,
                  child: Text('Add Branch', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                ),
                SizedBox(width: 19),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.search)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      'Branch Name',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Contact Number',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Stock',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Action',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
                rows: branchList.asMap().entries.map((entry) {
                  final index = entry.key;
                  final branch = entry.value;
                  return DataRow(
                    cells: [
                      DataCell(Text(branch.branchName)),
                      DataCell(Text(branch.contactNumber)),
                      DataCell(Text(branch.stock)),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteBranch(index),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
