import 'package:flutter/cupertino.dart';
import 'package:salesbrozz/controller/dashboard_controller.dart';
import 'package:salesbrozz/controller/payment_controller.dart';
import 'package:salesbrozz/view/invoice_admin/create_invoice/create_invoice.dart';

import '../../imports.dart';
import '../../widgets/cards/stats_card_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pay = PaymentController();
  final dash = DashboardController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 1.9,
          ),
          itemCount: dash.dashboardPurchaseList.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return StatsCardTile(data: dash, index: index);
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => CreateInvoiceTemplate()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
