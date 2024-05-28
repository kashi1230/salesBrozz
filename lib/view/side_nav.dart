import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../imports.dart';
import '../widgets/text/textbuilder.dart';
import 'init_screen/splash.dart';
import 'main_view.dart';

class SideNav extends StatefulWidget {
  String salesPermission;
  String purchasePermission;
  SideNav({Key? key, required this.salesPermission,required this.purchasePermission}) : super(key: key);
  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  int selectedTileIndex = -1;
  bool isExpanded = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  bool isExpanded5 = false;
  void handleTileTap(int index) {
    setState(() {
      selectedTileIndex = index;
    });

    List<int> routes = [
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,17, 18, 19, 20, 21, 22,23,24
    ];

    List<String> headtitle = [
      "Home", "Sales Invoice", "Purchase Invoice", "Invoce Setting", "Invoice DashBoard", "Leadger", "My Purchase",
      "My Sales","My Stock","Add Your Model ", "IMEI Tracker", "Price List", "Scheme", "Price Drops",
      "Profit & Loss", "My Customer", "My Distributors", "Scheme Dashboard",
      "Add Scheme", "My earnings", "My reatiler Type", "Staff Managment",
      "My Approvels ", "Branch mangment", "Transfer Challans"
    ];
    if (index >= 0 && index < routes.length) {
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => MainView(
                  initRoute: routes[index],
                  headTitle: headtitle[index],
                )),
        (route) => false,
      );
    }
  }

  Widget getScreen() {
    if (widget.salesPermission == "Yes") {
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
              title: TextBuilder(
                text: "MY INVOICES",
                color: isExpanded ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              leadingIcon: Icon(
                Icons.receipt_long,
                color: isExpanded ? Colors.white : Colors.black,
              ),
              index: 0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                buildTile(
                  color:
                  selectedTileIndex == 5 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.assured_workload,
                  title: "Leadger",
                  index: 5,
                ),
                buildTile(
                  color:
                  selectedTileIndex == 7 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.point_of_sale_rounded,
                  title: "My sales",
                  index: 7,
                ),
                buildExpansionTile(
                    ch: Column(
                      children: [
                        buildTile(
                          leadingIcon: Icons.backpack,
                          title: "My Stock",
                          index: 8,
                        ),
                        buildTile(
                          leadingIcon: Icons.edit_note_outlined,
                          title: "Stock Audit",
                          index: 9,
                        ),
                        buildTile(
                          leadingIcon: Icons.add_circle,
                          title: "Add Your  Model",
                          index: 9,
                        ),
                      ],
                    ),
                    title: TextBuilder(
                      text: "STOCK MNGMT",
                      color: isExpanded5 ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    leadingIcon: Icon(
                      Icons.add_chart,
                      color: isExpanded5 ? Colors.white : Colors.black,
                    ),
                    index: 0,
                    onchganged: (bool expanding) {
                      setState(() {
                        isExpanded5 = expanding;
                      });
                    }),
                buildTile(
                  color:
                  selectedTileIndex == 10 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.search_off,
                  title: "IMEI Tracker",
                  index: 10,
                ),
                buildTile(
                  color:
                  selectedTileIndex == 11 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.list,
                  title: "Price List",
                  index: 11,
                ),
                buildTile(
                  color: selectedTileIndex == 12
                      ? Colors.blueAccent
                      : Colors.white,
                  leadingIcon: Icons.next_plan,
                  title: "Schemes",
                  index: 12,
                ),
                buildTile(
                  color: selectedTileIndex == 13
                      ? Colors.blueAccent
                      : Colors.white,
                  leadingIcon: Icons.system_update_tv,
                  title: "Price Drops",
                  index: 13,
                ),
                buildTile(
                  color: selectedTileIndex == 14
                      ? Colors.blueAccent
                      : Colors.white,
                  leadingIcon: Icons.balance_rounded,
                  title: "Profit & Loss",
                  index: 14,
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
                    index: 15,
                  ),
                  buildTile(
                    leadingIcon: Icons.person,
                    title: "My Distributors",
                    index: 16,
                  ),
                ],
              ),
              title: TextBuilder(
                text: "CUSTOMER RELATIONS",
                color: isExpanded2 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              leadingIcon: Icon(
                Icons.person_search,
                color: isExpanded2 ? Colors.white : Colors.black,
              ),
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
                    index: 17,
                  ),
                  buildTile(
                    leadingIcon: Icons.add_circle,
                    title: "Add Your Scm",
                    index: 18,
                  ),
                  buildTile(
                    leadingIcon: Icons.attach_money,
                    title: "My earnings",
                    index: 19,
                  ),
                  buildTile(
                    leadingIcon: Icons.emoji_emotions_rounded,
                    title: "My Reatiler Type",
                    index: 20,
                  ),
                ],
              ),
              title: TextBuilder(
                text: "SCHEME MNGMT",
                color: isExpanded3 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              leadingIcon: Icon(
                Icons.add_chart,
                color: isExpanded3 ? Colors.white : Colors.black,
              ),
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
                    index: 21,
                  ),
                  buildTile(
                    leadingIcon: Icons.paste_sharp,
                    title: "My Approvel",
                    index: 22,
                  ),
                  buildTile(
                    leadingIcon: Icons.food_bank_outlined,
                    title: "Branch MNGMT",
                    index: 23,
                  ),
                  buildTile(
                    leadingIcon: Icons.menu_book_outlined,
                    title: "transfer challan",
                    index: 24,
                  ),
                ],
              ),
              title: TextBuilder(
                text: "STAFF MNGMT",
                color: isExpanded4 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              leadingIcon: Icon(
                Icons.group,
                color: isExpanded4 ? Colors.white : Colors.black,
              ),
              index: 0,
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded4 = expanding;
                });
              }),
        ]),
      );
    } else if (widget.purchasePermission == "Yes") {
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
              title: TextBuilder(
                text: "MY INVOICES",
                color: isExpanded ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              leadingIcon: Icon(
                Icons.receipt_long,
                color: isExpanded ? Colors.white : Colors.black,
              ),
              index: 0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                buildTile(
                  color:
                  selectedTileIndex == 5 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.assured_workload,
                  title: "Leadger",
                  index: 5,
                ),
                buildTile(
                  color:
                  selectedTileIndex == 6 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.point_of_sale_rounded,
                  title: "My Purchase",
                  index: 6,
                ),
                buildExpansionTile(
                    ch: Column(
                      children: [
                        buildTile(
                          leadingIcon: Icons.backpack,
                          title: "My Stock",
                          index: 8,
                        ),
                        buildTile(
                          leadingIcon: Icons.edit_note_outlined,
                          title: "Stock Audit",
                          index: 9,
                        ),
                        buildTile(
                          leadingIcon: Icons.add_circle,
                          title: "Add Your  Model",
                          index: 9,
                        ),
                      ],
                    ),
                    title: TextBuilder(
                      text: "STOCK MNGMT",
                      color: isExpanded5 ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    leadingIcon: Icon(
                      Icons.add_chart,
                      color: isExpanded5 ? Colors.white : Colors.black,
                    ),
                    index: 0,
                    onchganged: (bool expanding) {
                      setState(() {
                        isExpanded5 = expanding;
                      });
                    }),
                buildTile(
                  color:
                  selectedTileIndex == 10 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.search_off,
                  title: "IMEI Tracker",
                  index: 10,
                ),
                buildTile(
                  color:
                  selectedTileIndex == 11 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.list,
                  title: "Price List",
                  index: 11,
                ),
                buildTile(
                  color: selectedTileIndex == 12
                      ? Colors.blueAccent
                      : Colors.white,
                  leadingIcon: Icons.next_plan,
                  title: "Schemes",
                  index: 12,
                ),
                buildTile(
                  color: selectedTileIndex == 13
                      ? Colors.blueAccent
                      : Colors.white,
                  leadingIcon: Icons.system_update_tv,
                  title: "Price Drops",
                  index: 13,
                ),
                buildTile(
                  color: selectedTileIndex == 14
                      ? Colors.blueAccent
                      : Colors.white,
                  leadingIcon: Icons.balance_rounded,
                  title: "Profit & Loss",
                  index: 14,
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
                    index: 15,
                  ),
                  buildTile(
                    leadingIcon: Icons.person,
                    title: "My Distributors",
                    index: 16,
                  ),
                ],
              ),
              title: TextBuilder(
                text: "CUSTOMER RELATIONS",
                color: isExpanded2 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              leadingIcon: Icon(
                Icons.person_search,
                color: isExpanded2 ? Colors.white : Colors.black,
              ),
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
                    index: 17,
                  ),
                  buildTile(
                    leadingIcon: Icons.add_circle,
                    title: "Add Your Scm",
                    index: 18,
                  ),
                  buildTile(
                    leadingIcon: Icons.attach_money,
                    title: "My earnings",
                    index: 19,
                  ),
                  buildTile(
                    leadingIcon: Icons.emoji_emotions_rounded,
                    title: "My Reatiler Type",
                    index: 20,
                  ),
                ],
              ),
              title: TextBuilder(
                text: "SCHEME MNGMT",
                color: isExpanded3 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              leadingIcon: Icon(
                Icons.add_chart,
                color: isExpanded3 ? Colors.white : Colors.black,
              ),
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
                    index: 21,
                  ),
                  buildTile(
                    leadingIcon: Icons.paste_sharp,
                    title: "My Approvel",
                    index: 22,
                  ),
                  buildTile(
                    leadingIcon: Icons.food_bank_outlined,
                    title: "Branch MNGMT",
                    index: 23,
                  ),
                  buildTile(
                    leadingIcon: Icons.menu_book_outlined,
                    title: "transfer challan",
                    index: 24,
                  ),
                ],
              ),
              title: TextBuilder(
                text: "STAFF MNGMT",
                color: isExpanded4 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              leadingIcon: Icon(
                Icons.group,
                color: isExpanded4 ? Colors.white : Colors.black,
              ),
              index: 0,
              onchganged: (bool expanding) {
                setState(() {
                  isExpanded4 = expanding;
                });
              }),
        ]),
      );
    } else if (widget.salesPermission == "No"||widget.purchasePermission == "No") {
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
              title: TextBuilder(
                text: "MY INVOICES",
                color: isExpanded ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              leadingIcon: Icon(
                Icons.receipt_long,
                color: isExpanded ? Colors.white : Colors.black,
              ),
              index: 0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                buildTile(
                  color:
                      selectedTileIndex == 5 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.assured_workload,
                  title: "Leadger",
                  index: 5,
                ),
                buildTile(
                  color:
                      selectedTileIndex == 6 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.point_of_sale_rounded,
                  title: "My Purchase",
                  index: 6,
                ),
                buildTile(
                  color:
                      selectedTileIndex == 7 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.point_of_sale_rounded,
                  title: "My sales",
                  index: 7,
                ),
                buildExpansionTile(
                    ch: Column(
                      children: [
                        buildTile(
                          leadingIcon: Icons.backpack,
                          title: "My Stock",
                          index: 8,
                        ),
                        buildTile(
                          leadingIcon: Icons.edit_note_outlined,
                          title: "Stock Audit",
                          index: 9,
                        ),
                        buildTile(
                          leadingIcon: Icons.add_circle,
                          title: "Add Your  Model",
                          index: 9,
                        ),
                      ],
                    ),
                    title: TextBuilder(
                      text: "STOCK MNGMT",
                      color: isExpanded5 ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    leadingIcon: Icon(
                      Icons.add_chart,
                      color: isExpanded5 ? Colors.white : Colors.black,
                    ),
                    index: 0,
                    onchganged: (bool expanding) {
                      setState(() {
                        isExpanded5 = expanding;
                      });
                    }),
                buildTile(
                  color:
                      selectedTileIndex == 10 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.search_off,
                  title: "IMEI Tracker",
                  index: 10,
                ),
                buildTile(
                  color:
                      selectedTileIndex == 11 ? Colors.blueAccent : Colors.white,
                  leadingIcon: Icons.list,
                  title: "Price List",
                  index: 11,
                ),
                buildTile(
                  color: selectedTileIndex == 12
                      ? Colors.blueAccent
                      : Colors.white,
                  leadingIcon: Icons.next_plan,
                  title: "Schemes",
                  index: 12,
                ),
                buildTile(
                  color: selectedTileIndex == 13
                      ? Colors.blueAccent
                      : Colors.white,
                  leadingIcon: Icons.system_update_tv,
                  title: "Price Drops",
                  index: 13,
                ),
                buildTile(
                  color: selectedTileIndex == 14
                      ? Colors.blueAccent
                      : Colors.white,
                  leadingIcon: Icons.balance_rounded,
                  title: "Profit & Loss",
                  index: 14,
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
                    index: 15,
                  ),
                  buildTile(
                    leadingIcon: Icons.person,
                    title: "My Distributors",
                    index: 16,
                  ),
                ],
              ),
              title: TextBuilder(
                text: "CUSTOMER RELATIONS",
                color: isExpanded2 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              leadingIcon: Icon(
                Icons.person_search,
                color: isExpanded2 ? Colors.white : Colors.black,
              ),
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
                    index: 17,
                  ),
                  buildTile(
                    leadingIcon: Icons.add_circle,
                    title: "Add Your Scm",
                    index: 18,
                  ),
                  buildTile(
                    leadingIcon: Icons.attach_money,
                    title: "My earnings",
                    index: 19,
                  ),
                  buildTile(
                    leadingIcon: Icons.emoji_emotions_rounded,
                    title: "My Reatiler Type",
                    index: 20,
                  ),
                ],
              ),
              title: TextBuilder(
                text: "SCHEME MNGMT",
                color: isExpanded3 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              leadingIcon: Icon(
                Icons.add_chart,
                color: isExpanded3 ? Colors.white : Colors.black,
              ),
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
                    index: 21,
                  ),
                  buildTile(
                    leadingIcon: Icons.paste_sharp,
                    title: "My Approvel",
                    index: 22,
                  ),
                  buildTile(
                    leadingIcon: Icons.food_bank_outlined,
                    title: "Branch MNGMT",
                    index: 23,
                  ),
                  buildTile(
                    leadingIcon: Icons.menu_book_outlined,
                    title: "transfer challan",
                    index: 24,
                  ),
                ],
              ),
              title: TextBuilder(
                text: "STAFF MNGMT",
                color: isExpanded4 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              leadingIcon: Icon(
                Icons.group,
                color: isExpanded4 ? Colors.white : Colors.black,
              ),
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
  final MenuController controller = Get.put(MenuController());
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
                  color: Colors.red,
                ),
                title: TextBuilder(
                  text: 'Log out',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExpansionTile(
      {required Widget title,
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
        title: title,
        leading: leadingIcon,
        childrenPadding: EdgeInsets.only(left: 70),
        children: [ch]);
  }

  Widget buildTile(
      {required IconData leadingIcon,
      required String title,
      required int index,
      color}) {
    return Container(
      color: color,
      child: ListTile(
        leading: Icon(
          leadingIcon,
          color: selectedTileIndex == index ? Colors.white : Colors.black,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: selectedTileIndex == index ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500),
        ),
        onTap: () => handleTileTap(index),
      ),
    );
  }
}
