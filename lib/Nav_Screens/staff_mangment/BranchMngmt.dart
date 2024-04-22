import 'package:flutter/material.dart';

import '../../widgets/Common Widgets/Button.dart';
import '../../widgets/Common Widgets/textfeild.dart';
import '../../widgets/text/textbuilder.dart';
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
        backgroundColor: Colors.white,
        title: TextBuilder(text: 'ADD Branch',),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textfield(label: "Branch Name",controller: branchNameController),
              textfield(label: "Contact Number",controller: contactNumberController),
              textfield(label: "Stock",controller: stockController),
            ],
          ),
        ),
        actions: [
          CancelButton(title: "Cancel",ontap: (){Navigator.pop(context);}),
          FButton(title: "Save",onpress: (){
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
          })
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.search)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("All Branches ↓",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          ),
          SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              shape: OutlineInputBorder(),
              color: Colors.white,
              child: DataTable(
                columns: [
                  DataColumn(label: TextBuilder(text:'Branch Name',fontSize: 16,fontWeight: FontWeight.bold,)),
                  DataColumn(label: TextBuilder(text:'Contact Number',fontSize: 16,fontWeight: FontWeight.bold,)),
                  DataColumn(label: TextBuilder(text:"Stock",fontSize: 16,fontWeight: FontWeight.bold,)),
                  DataColumn(label: TextBuilder(text:'Action',fontSize: 16,fontWeight: FontWeight.bold,)),
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
                          icon: Icon(Icons.delete,color: Colors.red,),
                          onPressed: () => _deleteBranch(index),
                        ),
                      ),
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
