import 'package:flutter/material.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/Button.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/textfeild.dart';
import 'package:salesbrozz/widgets/text/textbuilder.dart';

import 'Common_/Common.dart';

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: searchbar(),
            ),
            FButton(title: "+ Add Stock",onpress:(){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddStockDialog();
                },
              );
            } )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: StockSummaryCard(
                        totalCount: 100,
                        totalValue: 2000,
                        category: 'Mobiles',
                        color: Colors.blueAccent),
                  ),
                  Flexible(
                    child: StockSummaryCard(
                        totalCount: 150,
                        totalValue: 3000,
                        category: 'Tablets',
                        color: Colors.lightBlue),
                  ),
                ],
              ),
              SizedBox(height: 5),
              StockSummaryCard(
                  totalCount: 250,
                  totalValue: 5000,
                  category: 'Accessories',
                  color: Colors.orangeAccent),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 200,
                    child: searchbar()
                  ),
                  FButton(title: "Export to Excel",onpress: (){})
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextBuilder(text: "Stock data for User123 ↓",fontWeight: FontWeight.bold,fontSize: 16,),
              ),
              Card(
                color: Colors.white,
                  shape: LinearBorder(),
                  child: ProductDetailsTable()),
            ],
          ),
        ),
      ),
    );
  }
}

class AddStockDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Stock'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Search Product'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Functionality for scanning barcode
            },
            child: Text('Scan Barcode'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}

class ProductDetailsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Brand')),
          DataColumn(label: Text('Model')),
          DataColumn(label: Text('IMEI')),
          DataColumn(label: Text('Color')),
          DataColumn(label: Text('Quantity')),
          DataColumn(label: Text('Selling Price')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Brand 1')),
            DataCell(Text('Model 1')),
            DataCell(Text('IMEI 1')),
            DataCell(Text('Color 1')),
            DataCell(Text('10')),
            DataCell(Text('\$100')),
          ]),
          DataRow(cells: [
            DataCell(Text('Brand 2')),
            DataCell(Text('Model 2')),
            DataCell(Text('IMEI 2')),
            DataCell(Text('Color 2')),
            DataCell(Text('20')),
            DataCell(Text('\$200')),
          ]),
          // Add more rows as needed
        ],
      ),
    );
  }
}

