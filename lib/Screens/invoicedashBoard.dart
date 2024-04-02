import 'package:flutter/cupertino.dart';
import 'package:salesbrozz/controller/dashboard_controller.dart';
import 'package:salesbrozz/controller/payment_controller.dart';
import 'package:salesbrozz/view/invoice_admin/create_invoice/create_invoice.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/commonWidget.dart';
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
  final iconList = [
    Icon(Icons.add_shopping_cart_sharp, color: Colors.blue, size: 40,),
    Icon(Icons.currency_rupee_sharp, color: Colors.red, size: 40,),
    Icon(Icons.bar_chart, color: Colors.green, size: 40,),
    Icon(Icons.point_of_sale_sharp, color: Colors.deepOrangeAccent, size: 40,),
  ];
  final pricelist = [
    "00",
    "₹ 50000",
    "₹ 4567",
    "₹ 20004"
  ];
  final salnamelist = [
    "Total sales Invoices",
    "peanding Sales Ammount",
    "Paid sales Ammount",
    "Total sales Ammout"
  ];
  final purchasenamelist = [
    "Total Purchase Invoices",
    "peanding Purchase Ammount",
    "Paid Purchase Ammount",
    "Total Purchase Ammout"
  ];
  final pay = PaymentController();

  final dash = DashboardController();

  @override
  Widget build(BuildContext context) {
    double defaultRadius = 8.0;
    const double _cardWidth = 180;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(" YOUR SALES ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              SizedBox(height: 10,),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 1.9,
                ),
                itemCount: dash.dashboardPurchaseList.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return card(icon: iconList[index],
                      text2: salnamelist[index],
                      text1: pricelist[index]);
                },
              ),SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HButton(icon: Icons.add,text: "Create Sale Invoice",ontap: (){}),
                  Row(
                    children: [
                      Text("See More"),
                      SizedBox(width: 5,),
                      IButton(Icons.forward,(){}),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              SizedBox(height: 10,),
              Text(" YOUR PURCHASE ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              SizedBox(height: 10,),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 1.9,
                ),
                itemCount: dash.dashboardPurchaseList.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return card(
                      text1: pricelist[index],
                      text2: purchasenamelist[index],
                      icon: iconList[index]
                  );
                },
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HButton(icon: Icons.add,text: "Create Purchase Invoice",ontap: (){}),
                  Row(
                    children: [
                      Text("See More"),
                      SizedBox(width: 5,),
                      IButton(Icons.forward,(){}),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }

  Widget card({icon, String ?text1, String?text2}) {
    double defaultRadius = 8.0;
    const double _cardWidth = 180;
    return SizedBox(
        width: _cardWidth,
        height: 145,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme
                  .of(context)
                  .colorScheme
                  .outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: icon
                ),
                SizedBox(height: 27),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(text1!, style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(text2!),
                  ),
                )
              ],
            ),
          ),
        ));
  }

}
