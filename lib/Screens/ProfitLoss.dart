import 'package:flutter/material.dart';
class Phone {
  final String name;
  final double purchasePrice;
  final double sellPrice;
  final double mrp;

  Phone({
    required this.name,
    required this.purchasePrice,
    required this.sellPrice,
    required this.mrp,
  });
}


class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  List<Phone> phones = [
    Phone(name: 'All', purchasePrice: 2000, sellPrice: 2500, mrp: 3000),
    Phone(name: 'Realme', purchasePrice: 200, sellPrice: 250, mrp: 300),
    Phone(name: 'Oppo', purchasePrice: 180, sellPrice: 220, mrp: 270),
    Phone(name: 'Vivo', purchasePrice: 190, sellPrice: 230, mrp: 280),
    Phone(name: 'Samsung', purchasePrice: 250, sellPrice: 300, mrp: 350),
  ];

  Phone? selectedPhone;
  String selectedDateRange = 'Select Date Range';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: DropdownButton<String>(
              value: selectedDateRange,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDateRange = newValue!;
                });
              },
              items: <String>['Select Date Range', 'Last 7 Days', 'Last 30 Days', 'Custom']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white,
            shape: LinearBorder(),
            child: Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: phones.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPhone = phones[index];
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedPhone == phones[index]
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(phones[index].name),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: selectedPhone != null
                ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(
                shape: LinearBorder(),
                color: Colors.white,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Primary Name')),
                    DataColumn(label: Text('Purchase Price')),
                    DataColumn(label: Text('Sell Price')),
                    DataColumn(label: Text('MRP')),
                    DataColumn(label: Text('Profit/Loss')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text(selectedPhone!.name)),
                      DataCell(Text(selectedPhone!.purchasePrice.toString())),
                      DataCell(Text(selectedPhone!.sellPrice.toString())),
                      DataCell(Text(selectedPhone!.mrp.toString())),
                      DataCell(Text((selectedPhone!.sellPrice - selectedPhone!.purchasePrice).toString())),
                    ]),
                  ],
                ),
              ),
            )
                : Center(
              child: Text('Select a phone to view details.'),
            ),
          ),
        ],
      ),
    );
  }
}
