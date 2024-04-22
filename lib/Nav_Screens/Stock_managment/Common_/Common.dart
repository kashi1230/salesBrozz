import 'package:flutter/material.dart';

import '../../../widgets/text/textbuilder.dart';

class StockSummaryCard extends StatelessWidget {
  final int totalCount;
  final double totalValue;
  final String category;
  final Color color;

  StockSummaryCard(
      {required this.totalCount,
        required this.totalValue,
        required this.category,
        required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBuilder(text: "Total Count  -  \$$totalCount",color: Colors.white,),
            SizedBox(height: 2),
            TextBuilder(text: "Total value - \$$totalValue",color: Colors.white,),
            SizedBox(height: 3),
            TextBuilder(text: "$category",color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),
          ],
        ),
      ),
    );
  }
}