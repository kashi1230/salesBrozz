import 'package:salesbrozz/test.dart';

import '../imports.dart';
import '../widgets/text/textbuilder.dart';
import 'init_screen/splash.dart';
import 'main_view.dart';

class SideNav extends StatefulWidget {
  String permission;
  SideNav({Key? key, required this.permission}) : super(key: key);
  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  int selectedTileIndex = -1;
  bool isExpanded = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  void handleTileTap(int index) {
    setState(() {
      selectedTileIndex = index;
    });

    List<int> routes = [
      0, 1, 2, 3, 4, 5, 6,7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22
    ];

    List<String> headtitle =[
      "Home","Sales Invoice","Purchase Invoice","Invoce Setting" ,"Invoice DashBoard","Leadger","My Sales",
      "My Purchase","IMEI Tracker","Price List","Scheme","Price Drops","Profit & Loss","My Customer",
      "My Distributors","Scheme Dashboard","Add Scheme", "My earnings","My reatiler Type","Staff Managment",
      "My Approvels ","Branch mangment","Transfer Challans"
    ];
    if (index >= 0 && index < routes.length) {
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => MainView(initRoute: routes[index],headTitle: headtitle[index],)),
        (route) => false,
      );
    }
  }

  Widget getScreen() {
    if (widget.permission == "sales") {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          buildExpansionTile(
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded = expanding;
                });
              },
              ch: Column(
                children: [
                  buildTile(
                    leadingIcon: Icons.edit_document,
                    title: "sales Invoice",
                    index: 1,
                  ),
                  buildTile(
                    leadingIcon: Icons.edit,
                    title: "Invoice Setting",
                    index: 3,
                  ),
                  buildTile(
                    leadingIcon: Icons.dashboard,
                    title: "Invoice DashBoard",
                    index: 4,
                  ),
                ],
              ),
              title:  TextBuilder(text: "MY INVOICES",color: isExpanded ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 16,),
              leadingIcon: Icon(Icons.receipt_long,color: isExpanded ? Colors.white : Colors.black,),
              index: 0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                buildTile(
                  color: selectedTileIndex == 5 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.assured_workload,
                  title: "Leadger",
                  index: 5,
                ),
                buildTile(
                  color: selectedTileIndex == 7 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.point_of_sale_rounded,
                  title: "My sales",
                  index: 7,
                ),
                buildTile(
                  color: selectedTileIndex == 8 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.search_off,
                  title: "IMEI Tracker",
                  index: 8,
                ),
                buildTile(
                  color: selectedTileIndex == 9 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.list,
                  title: "Price List",
                  index: 9,
                ),
                buildTile(
                  color: selectedTileIndex == 10 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.next_plan,
                  title: "Schemes",
                  index: 10,
                ),
                buildTile(
                  color: selectedTileIndex == 11 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.system_update_tv,
                  title: "Price Drops",
                  index: 11,
                ),
                buildTile(
                  color: selectedTileIndex == 12 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.balance_rounded,
                  title: "Profit & Loss",
                  index: 12,
                ),

              ],
            ),
          ),
          buildExpansionTile(
              ch: Column(
                children: [
                  buildTile(
                    leadingIcon: Icons.person,
                    title: "My Customer",
                    index: 13,
                  ),
                  buildTile(
                    leadingIcon: Icons.person,
                    title: "My Distributors",
                    index: 14,
                  ),
                ],
              ),
              title: TextBuilder(text: "CUSTOMER RELATIONS",color: isExpanded2 ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),
              leadingIcon: Icon(Icons.person_search,color: isExpanded2 ? Colors.white : Colors.black,),
              index: 0,
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded2 = expanding;
                });
              }),
          buildExpansionTile(
              ch: Column(
                children: [
                  buildTile(
                    leadingIcon: Icons.dashboard_outlined,
                    title: "Schmeme dashBoard",
                    index: 15,
                  ),
                  buildTile(
                    leadingIcon: Icons.add_circle,
                    title: "Add Your Scm",
                    index: 16,
                  ),
                  buildTile(
                    leadingIcon: Icons.attach_money,
                    title: "My earnings",
                    index: 17,
                  ),
                  buildTile(
                    leadingIcon: Icons.emoji_emotions_rounded,
                    title: "My Reatiler Type",
                    index: 18,
                  ),
                ],
              ),
              title: TextBuilder(text: "SCHEME MGMT",color: isExpanded3 ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),
              leadingIcon:  Icon(Icons.add_chart,color: isExpanded3 ? Colors.white : Colors.black,),
              index: 0,
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded3 = expanding;
                });
              }),
          buildExpansionTile(
              ch: Column(
                children: [
                  buildTile(
                    leadingIcon: Icons.group,
                    title: "My staff",
                    index: 19,
                  ),
                  buildTile(
                    leadingIcon: Icons.paste_sharp,
                    title: "My Approvel",
                    index: 20,
                  ),
                  buildTile(
                    leadingIcon: Icons.food_bank_outlined,
                    title: "Branch MNGMT",
                    index: 21,
                  ),
                  buildTile(
                    leadingIcon: Icons.menu_book_outlined,
                    title: "transfer challan",
                    index: 22,
                  ),
                ],
              ),
              title:  TextBuilder(text: "STAFF MNGMTY",color: isExpanded4 ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),
              leadingIcon: Icon(Icons.group_add_outlined,color: isExpanded4 ? Colors.white : Colors.black,),
              index: 0,
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded4 = expanding;
                });
              }),

        ]),
      );
    } else if (widget.permission == "purchase") {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          buildExpansionTile(
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded = expanding;
                });
              },
              ch: Column(
                children: [
                  buildTile(
                    color: selectedTileIndex == 2 ? Colors.blueAccent : Colors.white,
                    leadingIcon: Icons.edit_document,
                    title: "Purchace Invoice",
                    index: 2,
                  ),
                  buildTile(
                    color: selectedTileIndex == 3 ? Colors.blueAccent : Colors.white,
                    leadingIcon: Icons.edit,
                    title: "Invoice Setting",
                    index: 3,
                  ),
                  buildTile(
                    color: selectedTileIndex == 4 ? Colors.blueAccent : Colors.white,
                    leadingIcon: Icons.dashboard,
                    title: "Invoice DashBoard",
                    index: 4,
                  ),
                ],
              ),
              title:TextBuilder(text: "MY INVOICES",color: isExpanded ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),
              leadingIcon:  Icon(Icons.receipt_long,color: isExpanded ? Colors.white : Colors.black,),
              index: 0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                buildTile(
                  color: selectedTileIndex == 5 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.assured_workload,
                  title: "Leadger",
                  index: 5,
                ),
                buildTile(
                  color: selectedTileIndex == 6 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.point_of_sale_rounded,
                  title: "My Purchase",
                  index: 6,
                ),
                buildTile(
                  color: selectedTileIndex == 8 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.search_off,
                  title: "IMEI Tracker",
                  index: 8,
                ),
                buildTile(
                  color: selectedTileIndex == 9 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.list,
                  title: "Price List",
                  index: 9,
                ),
                buildTile(
                  color: selectedTileIndex == 9 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.next_plan,
                  title: "Schemes",
                  index: 10,
                ),
                buildTile(
                  color: selectedTileIndex == 11 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.system_update_tv,
                  title: "Price Drops",
                  index: 11,
                ),
                buildTile(
                  color: selectedTileIndex == 12 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.balance_rounded,
                  title: "Profit & Loss",
                  index: 12,
                ),
              ],
            ),
          ),
          buildExpansionTile(
              ch: Column(
                children: [
                  buildTile(
                    leadingIcon: Icons.person,
                    title: "My Customer",
                    index: 13,
                  ),
                  buildTile(
                    leadingIcon: Icons.person,
                    title: "My Distributors",
                    index: 14,
                  ),
                ],
              ),
              title:TextBuilder(text: "CUSTOMER RELATIONS",color: isExpanded2 ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),
              leadingIcon: Icon(Icons.person_search,color: isExpanded2 ? Colors.white : Colors.black,),
              index: 0,
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded2 = expanding;
                });
              }),
          buildExpansionTile(
              ch: Column(
                children: [
                  buildTile(
                    leadingIcon: Icons.dashboard_outlined,
                    title: "Schmeme dashBoard",
                    index: 15,
                  ),
                  buildTile(
                    leadingIcon: Icons.add_circle,
                    title: "Add Your Scm",
                    index: 16,
                  ),
                  buildTile(
                    leadingIcon: Icons.attach_money,
                    title: "My earnings",
                    index: 17,
                  ),
                  buildTile(
                    leadingIcon: Icons.emoji_emotions_rounded,
                    title: "My Reatiler Type",
                    index: 18,
                  ),
                ],
              ),
              title: TextBuilder(text: "SCHEME MNGMT",color: isExpanded3 ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),
              leadingIcon: Icon(Icons.add_chart,color: isExpanded3 ? Colors.white : Colors.black,),
              index: 0,
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded3 = expanding;
                });
              }),
          buildExpansionTile(
              ch: Column(
                children: [
                  buildTile(
                    leadingIcon: Icons.group,
                    title: "My staff",
                    index: 19,
                  ),
                  buildTile(
                    leadingIcon: Icons.paste_sharp,
                    title: "My Approvel",
                    index: 20,
                  ),
                  buildTile(
                    leadingIcon: Icons.food_bank_outlined,
                    title: "Branch MNGMT",
                    index: 21,
                  ),
                  buildTile(
                    leadingIcon: Icons.menu_book_outlined,
                    title: "transfer challan",
                    index: 22,
                  ),
                ],
              ),
              title:TextBuilder(text: "STAFF MNGMT",color: isExpanded4 ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),
              leadingIcon:  Icon(Icons.group_add_outlined,color: isExpanded4 ? Colors.white : Colors.black,),
              index: 0,
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded4 = expanding;
                });
              }),

        ]),
      );
    } else if (widget.permission == "Both") {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          buildExpansionTile(
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded = expanding;
                });
              },
              ch: Column(
                children: [
                  buildTile(
                    leadingIcon: Icons.edit_document,
                    title: "sales Invoice",
                    index: 1,
                  ),
                  buildTile(
                    leadingIcon: Icons.edit_document,
                    title: "Purchase  Invoice",
                    index: 2,
                  ),
                  buildTile(
                    leadingIcon: Icons.edit,
                    title: "Invoice Setting",
                    index: 3,
                  ),
                  buildTile(
                    leadingIcon: Icons.dashboard,
                    title: "Invoice DashBoard",
                    index: 4,
                  ),
                ],
              ),
              title:TextBuilder(text: "MY INVOICES",color: isExpanded ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),
              leadingIcon: Icon(Icons.receipt_long,color: isExpanded ? Colors.white : Colors.black,),
              index: 0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                buildTile(
                  color: selectedTileIndex == 5 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.assured_workload,
                  title: "Leadger",
                  index: 5,
                ),
                buildTile(
                  color: selectedTileIndex == 6 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.point_of_sale_rounded,
                  title: "My Purchase",
                  index: 7,
                ),
                buildTile(
                  color: selectedTileIndex == 7 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.point_of_sale_rounded,
                  title: "My sales",
                  index: 6,
                ),
                buildTile(
                  color: selectedTileIndex == 8 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.search_off,
                  title: "IMEI Tracker",
                  index: 8,
                ),
                buildTile(
                  color: selectedTileIndex == 9 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.list,
                  title: "Price List",
                  index: 9,
                ),
                buildTile(
                  color: selectedTileIndex == 10 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.next_plan,
                  title: "Schemes",
                  index: 10,
                ),
                buildTile(
                  color: selectedTileIndex == 11 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.system_update_tv,
                  title: "Price Drops",
                  index: 11,
                ),
                buildTile(
                  color: selectedTileIndex == 12 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.balance_rounded,
                  title: "Profit & Loss",
                  index: 12,
                ),
              ],
            ),
          ),
          buildExpansionTile(
              ch: Column(
                children: [
                  buildTile(
                    leadingIcon: Icons.person,
                    title: "My Customer",
                    index: 13,
                  ),
                  buildTile(
                    leadingIcon: Icons.person,
                    title: "My Distributors",
                    index: 14,
                  ),
                ],
              ),
              title:TextBuilder(text: "CUSTOMER RELATIONS",color: isExpanded2 ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),
              leadingIcon: Icon(Icons.person_search,color: isExpanded2 ? Colors.white : Colors.black,),
              index: 0,
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded2 = expanding;
                });
              }),
          buildExpansionTile(
              ch: Column(
                children: [
                  buildTile(
                    leadingIcon: Icons.dashboard_outlined,
                    title: "Schmeme dashBoard",
                    index: 15,
                  ),
                  buildTile(
                    leadingIcon: Icons.add_circle,
                    title: "Add Your Scm",
                    index: 16,
                  ),
                  buildTile(
                    leadingIcon: Icons.attach_money,
                    title: "My earnings",
                    index: 17,
                  ),
                  buildTile(
                    leadingIcon: Icons.emoji_emotions_rounded,
                    title: "My Reatiler Type",
                    index: 18,
                  ),
                ],
              ),
              title:TextBuilder(text: "SCHEME MNGMT",color: isExpanded3 ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),
              leadingIcon:  Icon(Icons.add_chart,color: isExpanded3 ? Colors.white : Colors.black,),
              index: 0,
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded3 = expanding;
                });
              }),
          buildExpansionTile(
              ch: Column(
                children: [
                  buildTile(
                    leadingIcon: Icons.group,
                    title: "My staff",
                    index: 19,
                  ),
                  buildTile(
                    leadingIcon: Icons.paste_sharp,
                    title: "My Approvel",
                    index: 20,
                  ),
                  buildTile(
                    leadingIcon: Icons.food_bank_outlined,
                    title: "Branch MNGMT",
                    index: 21,
                  ),
                  buildTile(
                    leadingIcon: Icons.menu_book_outlined,
                    title: "transfer challan",
                    index: 22,
                  ),
                ],
              ),
              title: TextBuilder(text: "STAFF MNGMT",color: isExpanded4 ? Colors.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),
              leadingIcon: Icon(Icons.group,color: isExpanded4 ? Colors.white : Colors.black,),
              index: 0,
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded4 = expanding;
                });
              }),

        ]),
      );
    }
    return Container();
  }

  Widget Listtile({required String title, ontap}) {
    return ListTile(
      title: Text(title),
      onTap: ontap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.black45,
                          offset: Offset(5.0, 5.0),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white),
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        maxRadius: 30.0,
                        backgroundColor: Colors.black,
                        child: TextBuilder(text: 'Logo'),
                      ),
                      title: TextBuilder(
                        text: 'SalesBroz',
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              getScreen(),
              ListTile(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => Splash()),
                      (route) => false);
                },
                leading: Icon(
                  Icons.power_settings_new,
                  color: Colors.black,
                ),
                title: TextBuilder(
                  text: 'Log out',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExpansionTile(
      { required Widget title,
      required Icon leadingIcon,
      required int index,
      required Widget ch,
      onchganged}) {
    return ExpansionTile(
        backgroundColor: Colors.blue,
        collapsedBackgroundColor: Colors.white,
        onExpansionChanged: onchganged,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        title:title,
        leading: leadingIcon,
        childrenPadding: EdgeInsets.only(left: 70),
        children: [ch]);
  }

  Widget buildTile({
    required IconData leadingIcon,
    required String title,
    required int index,
    color
  }) {
    return Container(
      color:color,
      child: ListTile(
        leading: Icon(
          leadingIcon,  color: selectedTileIndex == index ? Colors.white : Colors.black,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: selectedTileIndex == index ? Colors.white : Colors.black,fontWeight: FontWeight.w500
          ),
        ),
        onTap: () => handleTileTap(index),
      ),
    );
  }
}
