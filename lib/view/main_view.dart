import 'package:provider/provider.dart';
import 'package:salesbrozz/Nav_Screens/Invoice/purchaceInvoice.dart';
import 'package:salesbrozz/Nav_Screens/Stock_managment/My_stock.dart';
import 'package:salesbrozz/Nav_Screens/Stock_managment/add_model.dart';
import 'package:salesbrozz/Nav_Screens/Stock_managment/stock_audit.dart';
import 'package:salesbrozz/view/side_nav.dart';
import '../Nav_Screens/ImeiTracker.dart';
import '../Nav_Screens/Invoice/InvoiceSetting.dart';
import '../Nav_Screens/Invoice/invoicedashBoard.dart';
import '../Nav_Screens/Invoice/salesInvoice.dart';
import '../Nav_Screens/scheme_Managment/My_earnings.dart';
import '../Nav_Screens/Mypurchasces.dart';
import '../Nav_Screens/Mysales.dart';
import '../Nav_Screens/PriceDrops.dart';
import '../Nav_Screens/ProfitLoss.dart';
import '../Nav_Screens/customer_relatioons/MyCustomers.dart';
import '../Nav_Screens/customer_relatioons/MyDistributers.dart';
import '../Nav_Screens/ledger.dart';
import '../Nav_Screens/scheme_Managment/MyRetailer.dart';
import '../Nav_Screens/scheme_Managment/Schemes.dart';
import '../Nav_Screens/scheme_Managment/addSchems.dart';
import '../Nav_Screens/scheme_Managment/schemedashboard.dart';
import '../Nav_Screens/staff_mangment/BranchMngmt.dart';
import '../Nav_Screens/staff_mangment/My approvels.dart';
import '../Nav_Screens/staff_mangment/myStaff.dart';
import '../Nav_Screens/staff_mangment/transferchallans.dart';
import '../imports.dart';
import '../main.dart';
import '../widgets/text/textbuilder.dart';

class MainView extends StatefulWidget {
  final int initRoute;
  String headTitle;
  MainView({super.key, required this.initRoute, required this.headTitle});
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    DashboardScreen(), SalesInvoiceScreen(), PurchaceInvoiceScreen(), InvoiceSettingsScreen(),
    InvoicedashBoard(), Leadger(), MyPurchase(), MySales(),StockScreen(),AddModelScreen(), TrackingScreen(),
    PriceListScreen(), Schemes(), PriceDropsScreen(), ProfitLossScreen(),
    MyCustomerScreen(), MyDistributorScreen(), DashboardScreen(),
    AddSchemeScreen(), EarningsDashboard(), RetailerType(), StaffManagementScreen(), MyApprovels(), BranchManagementScreen(), ChallenScreen()
  ];
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initRoute;
  }

  @override
  Widget build(BuildContext context) {
    final salePermission = context.watch<ValueProvider>().salePermission;
    final purchasePermission = context.watch<ValueProvider>().purchasePermission;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: TextBuilder(
          text: widget.headTitle,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      drawer: Drawer(
          backgroundColor: Colors.blue, child: SideNav(salesPermission: salePermission,purchasePermission: purchasePermission,)),
      body: tabs[_currentIndex],
    );
  }
}
// Navigator.pop(context);
// Navigator.pushAndRemoveUntil(
// context, MaterialPageRoute(builder: (_) => MainView(initRoute: i)), (route) => false);
//
