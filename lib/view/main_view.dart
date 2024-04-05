

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
import 'package:salesbrozz/view/init_screen/login/login_page.dart';
import 'package:salesbrozz/view/side_nav.dart';

import '../imports.dart';
import '../widgets/text/textbuilder.dart';
import 'home/home.dart';
import 'invoice_admin/invoice/invoice.dart';

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
    PriceDropsScreen(),PhoneScreen(),CustomerScreen(),DistriButors(),
    DashboardScreen(),SchemeScreen(),EarningsDashboard(),RetailerType(),
    StaffManagementScreen(),MyApprovels(),BranchManagementScreen(),TransferChallans()
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
// Navigator.pop(context);
// Navigator.pushAndRemoveUntil(
// context, MaterialPageRoute(builder: (_) => MainView(initRoute: i)), (route) => false);
//
