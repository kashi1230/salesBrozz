import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  String modelName = '';
  String dp = '';
  String mop = '';
  String mrp = '';

  String selectedBrand = '';
  String selectedPhone = '';

  String selectedHsn = '';
  String selectedTax = '';
  String selectedColor = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Model Name'),
            onChanged: (value) {
              setState(() {
                modelName = value;
              });
            },
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

                onChanged: (val) {},
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

                onChanged: (val) {},
              ),)
            ],
          ),

          TextFormField(
            decoration: InputDecoration(labelText: 'DP'),
            onChanged: (value) {
              setState(() {
                dp = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'MOP'),
            onChanged: (value) {
              setState(() {
                mop = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'MRP'),
            onChanged: (value) {
              setState(() {
                mrp = value;
              });
            },
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

                onChanged: (val) {},
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

                onChanged: (val) {},
              ),)
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle form submission
              print('Model Name: $modelName');
              print('Selected Brand: $selectedBrand');
              print('Selected Phone: $selectedPhone');
              print('DP: $dp');
              print('MOP: $mop');
              print('MRP: $mrp');
              print('Selected HSN: $selectedHsn');
              print('Selected Tax: $selectedTax');
              print('Selected Color: $selectedColor');
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget buildExpansionTile({
    required String title,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return ExpansionTile(
      title: Text(title),
      children: [
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
                onTap: () {
                  setState(() {
                    onChanged(items[index]);
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
