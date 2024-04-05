

import 'package:salesbrozz/Screens/BranchMngmt.dart';
import 'package:salesbrozz/Screens/ImeiTracker.dart';
import 'package:salesbrozz/Screens/InvoiceSetting.dart';
import 'package:salesbrozz/Screens/My%20approvels.dart';
import 'package:salesbrozz/Screens/MyCustomers.dart';
import 'package:salesbrozz/Screens/MyDistributers.dart';
import 'package:salesbrozz/Screens/MyRetailer.dart';
import 'package:salesbrozz/Screens/Myearnings.dart';
import 'package:salesbrozz/Screens/Mypurchasces.dart';
import 'package:salesbrozz/Screens/Mysales.dart';
import 'package:salesbrozz/Screens/PriceDrops.dart';
import 'package:salesbrozz/Screens/ProfitLoss.dart';
import 'package:salesbrozz/Screens/Schemes.dart';
import 'package:salesbrozz/Screens/addSchems.dart';
import 'package:salesbrozz/Screens/invoicedashBoard.dart';
import 'package:salesbrozz/Screens/ledger.dart';
import 'package:salesbrozz/Screens/myStaff.dart';
import 'package:salesbrozz/Screens/priceList.dart';
import 'package:salesbrozz/Screens/purchaceInvoice.dart';
import 'package:salesbrozz/Screens/salesInvoice.dart';
import 'package:salesbrozz/Screens/schemedashboard.dart';
import 'package:salesbrozz/Screens/transferchallans.dart';
import 'package:salesbrozz/view/side_nav.dart';
import '../imports.dart';
import '../widgets/text/textbuilder.dart';
import 'home/home.dart';

class MainView extends StatefulWidget {
  final int initRoute;
   MainView({Key? key, required this.initRoute,}) : super(key: key);
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  List<Widget> tabs = [Home(), SalesInvoiceScreen(), PurchaceInvoiceScreen(),
    InvoiceSettingsScreen(),InvoicedashBoard(),Leadger(),
    MyPurchase(),MySales(),TrackingScreen(),PriceListScreen(),Schemes(),
    PriceDropsScreen(),PhoneScreen(),MyCustomerScreen(),MyDistriButorsScreen(),
    DashboardScreen(),AddSchemeScreen(),EarningsDashboard(),RetailerType(),
    StaffManagementScreen(),MyApprovels(),BranchManagementScreen(),MyScreen()
  ];
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initRoute;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: TextBuilder(
          text:  "SalesBroz",
          color: Colors.black,
        ),
      ),
      drawer: Drawer(child: SideNav(permission:"sales")),
      body: tabs[_currentIndex],
    );
  }
}
// Row(
// children: [
// ElevatedButton(
// onPressed: () {},
// child: Icon(Icons.person_add, color: Colors.white),
// style: ElevatedButton.styleFrom(
// shape: CircleBorder(),
// padding: EdgeInsets.all(4),
// backgroundColor: Colors.black,
// foregroundColor: Colors.cyan,
// ),
// ),
// Text("Add",style: TextStyle(fontWeight: FontWeight.bold),)
// ],
// ),
// Navigator.pop(context);
// Navigator.pushAndRemoveUntil(
// context, MaterialPageRoute(builder: (_) => MainView(initRoute: i)), (route) => false);
//
// onPressed: () {
// // Handle add customer button tap
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
// title: Text('Add Customer'),
// content: Column(
// mainAxisSize: MainAxisSize.min,
// children: [
// TextField(
// controller: nameController,
// decoration: InputDecoration(labelText: 'Name'),
// ),
// TextField(
// controller: contactNumberController,
// decoration: InputDecoration(labelText: 'Contact Number'),
// ),
// TextField(
// controller: typeController,
// decoration: InputDecoration(labelText: 'Type'),
// ),
// TextField(
// controller: cityController,
// decoration: InputDecoration(labelText: 'City'),
// ),
// SizedBox(height: 20),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// ElevatedButton(
// onPressed: () {
// addCustomer();
// Navigator.of(context).pop();
// },
// child: Text('Save'),
// ),
// ElevatedButton(
// onPressed: () {
// Navigator.of(context).pop();
// },
// child: Text('Cancel'),
// ),
// ],
// ),
// ],
// ),
// );
// },
// );
// },
