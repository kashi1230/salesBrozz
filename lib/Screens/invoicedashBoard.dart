import 'package:flutter/cupertino.dart';
import 'package:salesbrozz/controller/dashboard_controller.dart';
import 'package:salesbrozz/controller/payment_controller.dart';
import 'package:salesbrozz/view/invoice_admin/create_invoice/create_invoice.dart';
import 'package:salesbrozz/widgets/button/profile_button_tile.dart';

import '../../imports.dart';
import '../../widgets/cards/stats_card_tile.dart';
import '../utils/commons.dart';
import '../widgets/text/textbuilder.dart';

class InvoicedashBoard extends StatefulWidget {

  InvoicedashBoard({super.key});

  @override
  State<InvoicedashBoard> createState() => _InvoicedashBoardState();
}

class _InvoicedashBoardState extends State<InvoicedashBoard> {
  final pay = PaymentController();

  final dash = DashboardController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("sales Invoices"),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 1.6,
                ),
                itemCount: dash.dashboardPurchaseList.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return StatsCardTile(data: dash, index: index);
                },
              ),
              Text("purchace Invoices"),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 1.6,
                ),
                itemCount: dash.dashboardPurchaseList.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return StatsCardTile(data: dash, index: index);
                },
              ),
            //   Container(
            //     height: 40,
            //       width: 150,
            // child: loginButton())
            ],
          ),
        ),
      ),
    );
  }
  Widget loginButton({ontap}) {
    String val ="Sales";
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: TextBuilder(text: 'Login', fontSize: 15, color: Colors.white),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Commons.gradientBackgroundColorStart, Commons.gradientBackgroundColorEnd],
          ),
        ),
      ),
    );
  }

}

