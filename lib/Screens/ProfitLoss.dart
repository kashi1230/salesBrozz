import 'package:flutter/material.dart';

class Item {
  String primaryName;
  String purchasePrice;
  String sellPrice;
  String sellIn;
  String sellOut;
  String mrp;
  String dop;
  String diff;
  String imeiID;
  String criteriaType;

  Item({
    required this.primaryName,
    required this.purchasePrice,
    required this.sellPrice,
    required this.sellIn,
    required this.sellOut,
    required this.mrp,
    required this.dop,
    required this.diff,
    required this.imeiID,
    required this.criteriaType,
  });
}

class ProfitLossScreen extends StatelessWidget {
  final List<Item> items = [
    Item(
      primaryName: 'Realme',
      purchasePrice: '\$200',
      sellPrice: '\$300',
      sellIn: '2021-01-01',
      sellOut: '2021-02-01',
      mrp: '\$350',
      dop: '2020-12-01',
      diff: '+\$100',
      imeiID: '1234567890',
      criteriaType: 'Phone',
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(items[index].primaryName[0])),
              title: Text(items[index].primaryName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Purchase Price: ${items[index].purchasePrice}'),
                  Text('Sell Price: ${items[index].sellPrice}'),
                  Text('Sell In: ${items[index].sellIn}'),
                  Text('Sell Out: ${items[index].sellOut}'),
                  Text('MRP: ${items[index].mrp}'),
                  Text('DOP: ${items[index].dop}'),
                  Text('Diff: ${items[index].diff}'),
                  Text('IMEI ID: ${items[index].imeiID}'),
                  Text('Criteria Type: ${items[index].criteriaType}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}