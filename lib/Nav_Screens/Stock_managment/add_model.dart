import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:salesbrozz/Get_x/Stock_controller/Add-Model_controller.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/textfeild.dart';
import 'package:salesbrozz/widgets/text/textbuilder.dart';

import '../../widgets/Common Widgets/Button.dart';

class AddModelScreen extends StatefulWidget {
  @override
  _AddModelScreenState createState() => _AddModelScreenState();
}

class _AddModelScreenState extends State<AddModelScreen> {
  @override
  Widget build(BuildContext context) {
    final AddModelController controller = Get.put(AddModelController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            FButton(title: "+ New Product",onpress: (){
              showDialog(context: context,
                  builder:(BuildContext context){
                return AlertDialog(
                  shape: OutlineInputBorder(),
                  backgroundColor: Colors.white,
                  title: Text("Add product"),
                  content: SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: "Model name"),
                          controller: controller.ModelController.value,
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(child: DropDownTextField(
                              dropdownColor: Colors.white,
                              textFieldDecoration: InputDecoration(
                                hintText: "Search Brand",
                              ),
                              // initialValue: "name4",
                              listSpace: 20,
                              listPadding: ListPadding(top: 20),
                              enableSearch: true,
                              validator: (value) {
                                if (value == null) {
                                  return "Required field";
                                } else {
                                  return null;
                                }
                              },
                              dropDownList: const [
                                DropDownValueModel(name: 'name1', value: "value1"),
                                DropDownValueModel(name: 'name2', value: "value2"),
                                DropDownValueModel(name: 'name3', value: "value3"),
                                DropDownValueModel(name: 'name4', value: "value4"),
                                DropDownValueModel(name: 'name5', value: "value5"),
                                DropDownValueModel(name: 'name6', value: "value6"),
                                DropDownValueModel(name: 'name7', value: "value7"),
                                DropDownValueModel(name: 'name8', value: "value8"),
                              ],
                              listTextStyle: const TextStyle(color: Colors.red),
                              dropDownItemCount: 8,

                              onChanged: (val) {
                              },
                            ),),
                            SizedBox(width: 8,),
                            Expanded(child: DropDownTextField(
                              dropdownColor: Colors.white,
                              textFieldDecoration: InputDecoration(
                                hintText: "Search HSN",
                              ),
                              // initialValue: "name4",
                              listSpace: 20,
                              listPadding: ListPadding(top: 20),
                              enableSearch: true,
                              validator: (value) {
                                if (value == null) {
                                  return "Required field";
                                } else {
                                  return null;
                                }
                              },
                              dropDownList: const [
                                DropDownValueModel(name: 'name1', value: "value1"),
                                DropDownValueModel(name: 'name2', value: "value2"),
                                DropDownValueModel(name: 'name3', value: "value3"),
                                DropDownValueModel(name: 'name4', value: "value4"),
                                DropDownValueModel(name: 'name5', value: "value5"),
                                DropDownValueModel(name: 'name6', value: "value6"),
                                DropDownValueModel(name: 'name7', value: "value7"),
                                DropDownValueModel(name: 'name8', value: "value8"),
                              ],
                              listTextStyle: const TextStyle(color: Colors.red),
                              dropDownItemCount: 8,

                              onChanged: (val) {
                              },
                            ),)
                          ],
                        ),

                        TextFormField(
                          decoration: InputDecoration(labelText: 'DP'),
                          controller: controller.DpController.value,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'MOP'),
                          controller: controller.MopController.value,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'MRP'),
                          controller: controller.MRpController.value,
                        ),
                        Row(
                          children: [
                            Expanded(child: DropDownTextField(
                              dropdownColor: Colors.white,
                              textFieldDecoration: InputDecoration(
                                hintText: "Select Tax",
                              ),
                              // initialValue: "name4",
                              listSpace: 20,
                              listPadding: ListPadding(top: 20),
                              enableSearch: true,
                              validator: (value) {
                                if (value == null) {
                                  return "Required field";
                                } else {
                                  return null;
                                }
                              },
                              dropDownList: const [
                                DropDownValueModel(name: '5%', value: "5%"),
                                DropDownValueModel(name: 'name2', value: "value2"),
                                DropDownValueModel(name: 'name3', value: "value3"),
                                DropDownValueModel(name: 'name4', value: "value4"),
                                DropDownValueModel(name: 'name5', value: "value5"),
                                DropDownValueModel(name: 'name6', value: "value6"),
                                DropDownValueModel(name: 'name7', value: "value7"),
                                DropDownValueModel(name: 'name8', value: "value8"),
                              ],
                              listTextStyle: const TextStyle(color: Colors.red),
                              dropDownItemCount: 8,

                              onChanged: (val) {
                              },
                            ),),
                            SizedBox(width: 8,),
                            Expanded(child: DropDownTextField(
                              dropdownColor: Colors.white,
                              textFieldDecoration: InputDecoration(
                                hintText: "Color",
                              ),
                              // initialValue: "name4",
                              listSpace: 20,
                              listPadding: ListPadding(top: 20),
                              enableSearch: true,
                              validator: (value) {
                                if (value == null) {
                                  return "Required field";
                                } else {
                                  return null;
                                }
                              },
                              dropDownList: const [
                                DropDownValueModel(name: 'name', value: "value1"),
                                DropDownValueModel(name: 'name2', value: "value2"),
                                DropDownValueModel(name: 'name3', value: "value3"),
                                DropDownValueModel(name: 'name4', value: "value4"),
                                DropDownValueModel(name: 'name5', value: "value5"),
                                DropDownValueModel(name: 'name6', value: "value6"),
                                DropDownValueModel(name: 'name7', value: "value7"),
                                DropDownValueModel(name: 'name8', value: "value8"),
                              ],
                              listTextStyle: const TextStyle(color: Colors.black),
                              dropDownItemCount: 8,
                              dropDownIconProperty:IconProperty(color: Colors.blue) ,
                              clearIconProperty: IconProperty(color: Colors.blue),

                              onChanged: (val) {
                              },
                            ),)
                          ],
                        ),
                        SizedBox(height: 30.0),
                        FButton(title: "Save",onpress: (){controller.addModel();Get.back();}),
                        CancelButton(title: "Cancel",ontap: (){
                          Get.back();
                        })
                      ],
                    ),
                  ),
                );
                  }
              );
            })
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child:ArrowText(text:"My Customer")
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(
                shape: OutlineInputBorder(),
                child: SingleChildScrollView(
                  child: Obx(() => DataTable(
                    columns: [
                      DataColumn(label: TextBuilder(text: "Model Name",fontSize: 16,fontWeight: FontWeight.bold,)),
                      DataColumn(label: TextBuilder(text: "Brand",fontSize: 16,fontWeight: FontWeight.bold,)),
                      DataColumn(label: TextBuilder(text: "DP",fontSize: 16,fontWeight: FontWeight.bold,)),
                      DataColumn(label: TextBuilder(text: "MOP",fontSize: 16,fontWeight: FontWeight.bold,)),
                      DataColumn(label: TextBuilder(text: "MRP",fontSize: 16,fontWeight: FontWeight.bold,)),
                      DataColumn(label: TextBuilder(text: "Colors",fontSize: 16,fontWeight: FontWeight.bold,)),
                      DataColumn(label: TextBuilder(text: "Hsn No.",fontSize: 16,fontWeight: FontWeight.bold,)),
                      DataColumn(label: TextBuilder(text: "Tax",fontSize: 16,fontWeight: FontWeight.bold,)),
                      DataColumn(label: TextBuilder(text: "**",fontSize: 16,fontWeight: FontWeight.bold,)),
                    ],
                    rows: controller.Data.map((Data) => DataRow(
                      cells: [
                        DataCell(Text(Data['ModelName'] ?? '')),
                        DataCell(Text(Data['Brand'] ?? '')),
                        DataCell(Text(Data['Dp'] ?? '')),
                        DataCell(Text(Data['Mop'] ?? '')),
                        DataCell(Text(Data['MRP'] ?? '')),
                        DataCell(Text(Data['Color'] ?? '')),
                        DataCell(Text(Data['Hsn'] ?? '')),
                        DataCell(Text(Data['Tax'] ?? '')),
                        DataCell(
                            Container(
                                height: 30,
                                width: 90,
                                child: FButton(title: "Action", onpress: () {
                                  // Your action button functionality here
                                })
                            )
                        ),
                      ],
                    )).toList(),
                  ))
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showNewProductForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Product'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Model Name'),
                ),
                SizedBox(height: 10),
                // DropdownButtonFormField<String>(
                //   value: selectedBrand,
                //   onChanged: (value) {
                //     setState(() {
                //       selectedBrand = value!;
                //     });
                //   },
                //   items: [
                //     DropdownMenuItem(child: Text('Brand 1'), value: 'Brand '),
                //     DropdownMenuItem(child: Text('Brand 2'), value: 'Brand 2'),
                //     // Add more brand options
                //   ],
                //   decoration: InputDecoration(labelText: 'Brand'),
                // ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'DP'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'MOP'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'MRP'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Search HSN'),
                ),
                SizedBox(height: 10),
                // DropdownButtonFormField<String>(
                //   value: selectedTaxPercent,
                //   onChanged: (value) {
                //     setState(() {
                //       selectedTaxPercent = value!;
                //     });
                //   },
                //   items: [
                //     DropdownMenuItem(child: Text('Tax Percent 1'), value: 'Tax Percent '),
                //     DropdownMenuItem(child: Text('Tax Percent 2'), value: 'Tax Percent 2'),
                //     // Add more tax percent options
                //   ],
                //   decoration: InputDecoration(labelText: 'Tax Percent'),
                // ),
                // SizedBox(height: 10),
                // DropdownButtonFormField<String>(
                //   value: selectedColor,
                //   onChanged: (value) {
                //     setState(() {
                //       selectedColor = value!;
                //     });
                //   },
                //   items: [
                //     DropdownMenuItem(child: Text('Color 1'), value: 'Color '),
                //     DropdownMenuItem(child: Text('Color 2'), value: 'Color 2'),
                //     // Add more color options
                //   ],
                //   decoration: InputDecoration(labelText: 'Color'),
                // ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement action for submit button
                _showSubmittedDetails();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _showSubmittedDetails() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Submitted Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DataTable(
                  columns: [
                    DataColumn(label: Text('Field Name')),
                    DataColumn(label: Text('Field Data')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Model Name')),
                      DataCell(Text('Model Name Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Brand')),
                      DataCell(Text("")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('DP')),
                      DataCell(Text('DP Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('MOP')),
                      DataCell(Text('MOP Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('MRP')),
                      DataCell(Text('MRP Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Search HSN')),
                      DataCell(Text('Search HSN Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Tax Percent')),
                      DataCell(Text('selectedTaxPercent')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Color')),
                      DataCell(Text("")),
                    ]),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
