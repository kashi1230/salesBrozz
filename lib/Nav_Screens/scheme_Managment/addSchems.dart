import 'package:flutter/material.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/Button.dart';
import 'package:salesbrozz/widgets/text/textbuilder.dart';
class AddSchemeScreen extends StatefulWidget {
  @override
  _AddSchemeScreenState createState() => _AddSchemeScreenState();
}

class _AddSchemeScreenState extends State<AddSchemeScreen> {
  final TextEditingController schemeNameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController inactiveTypeController = TextEditingController();
  final TextEditingController targetTypeController = TextEditingController();
  final TextEditingController periodFromController = TextEditingController();
  final TextEditingController periodToController = TextEditingController();

  List<Map<String, String>> schemes = [];

  void addScheme() {
    schemes.add({
      'Scheme Name': schemeNameController.text,
      'Brand': brandController.text,
      'Inactive Type': inactiveTypeController.text,
      'Target Type': targetTypeController.text,
      'Period From': periodFromController.text,
      'Period To': periodToController.text,
    });
    // Clear text fields after adding scheme
    schemeNameController.clear();
    brandController.clear();
    inactiveTypeController.clear();
    targetTypeController.clear();
    periodFromController.clear();
    periodToController.clear();
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
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FButton(title: "Add Scheme",onpress: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text('Add Scheme'),
                        content: SingleChildScrollView(
                          scrollDirection: Axis.vertical,

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: schemeNameController,
                                decoration: InputDecoration(labelText: 'Scheme Name'),
                              ),
                              TextField(
                                controller: brandController,
                                decoration: InputDecoration(labelText: 'Brand'),
                              ),
                              TextField(
                                controller: inactiveTypeController,
                                decoration: InputDecoration(labelText: 'Inactive Type'),
                              ),
                              TextField(
                                controller: targetTypeController,
                                decoration: InputDecoration(labelText: 'Target Type'),
                              ),
                              TextField(
                                controller: periodFromController,
                                decoration: InputDecoration(labelText: 'Period From'),
                              ),
                              TextField(
                                controller: periodToController,
                                decoration: InputDecoration(labelText: 'Period To'),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FButton(title: "save",onpress: (){
                                    addScheme();
                                    Navigator.of(context).pop();
                                  }),
                                  CancelButton(title: "cancel",ontap: (){
                                    Navigator.of(context).pop();
                                  })
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
                SizedBox(width: 20,),
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
            child: Text("All  Schemes ↓",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          ),
          SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              color: Colors.white,
              shape:OutlineInputBorder(),
              child: DataTable(
                columns: [
                  DataColumn(label: TextBuilder(text:'Scheme Name',fontSize: 16,fontWeight: FontWeight.bold,)),
                  DataColumn(label: TextBuilder(text:'Brand',fontSize: 16,fontWeight: FontWeight.bold,)),
                  DataColumn(label: TextBuilder(text:"Inactive Type",fontSize: 16,fontWeight: FontWeight.bold,)),
                  DataColumn(label: TextBuilder(text:'Target Type',fontSize: 16,fontWeight: FontWeight.bold,)),
                  DataColumn(label: TextBuilder(text:'Period From',fontSize: 16,fontWeight: FontWeight.bold,)),
                  DataColumn(label: TextBuilder(text:'period To',fontSize: 16,fontWeight: FontWeight.bold,)),
                ],
                rows: schemes
                    .map(
                      (scheme) => DataRow(
                    cells: [
                      DataCell(Text(scheme['Scheme Name'] ?? '')),
                      DataCell(Text(scheme['Brand'] ?? '')),
                      DataCell(Text(scheme['Inactive Type'] ?? '')),
                      DataCell(Text(scheme['Target Type'] ?? '')),
                      DataCell(Text(scheme['Period From'] ?? '')),
                      DataCell(Text(scheme['Period To'] ?? '')),
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
