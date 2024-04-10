import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:salesbrozz/controller/dashboard_controller.dart';
import 'package:salesbrozz/controller/payment_controller.dart';
import '../../imports.dart';
import '../../main.dart';
import '../../widgets/cards/stats_card_tile.dart';

class Home extends StatefulWidget {
  Home({super.key,});
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Widget show(String permission){
    if(permission =="sales"){
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
        ),
      );
    }else if(permission == "purchase"){
      return  SafeArea(
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
        ),
      );
    }else if(permission == "Both"){
      return  SafeArea(
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
        ),
      );
    }
    return Container(child:  Text("you Dont't Have  permisson"),);
  }
  final pay = PaymentController();
  final dash = DashboardController();
  @override
  Widget build(BuildContext context) {
    String permission = Provider.of<ValueProvider>(context).permission;
    return show(permission);
  }
}
