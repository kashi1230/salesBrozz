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
  Widget getScreen(permission){
    if(permission == "sales"){
      return  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          ExpansionTile(
            title: Text("MY INVOICES"),
            leading: Icon(Icons.receipt_long),
            childrenPadding: EdgeInsets.only(left: 70),
            children: [
              ListView.builder(
                  itemCount: titleListsal.length,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  shrinkWrap: true,
                  itemBuilder: (Buildcontext,index){
                    return ListTile(
                      title: Text(titleListsal[index]),
                      onTap:(){
                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MainView(initRoute: index)),
                                (route) => false);
                      } ,
                    );
                  })
            ],
          ),
          ListTile(
            leading: Icon(Icons.edit_document),
            title: Text("Ledger"),
            onTap: () {
              Navigator.pop(context);
               Navigator.pushAndRemoveUntil(
                      context,
                 MaterialPageRoute(
                 builder: (_) => MainView(initRoute: 1)),
                      (route) => false);

            },
          ),
          // ListTile(
          //   leading: Icon(Icons.shopping_bag_outlined),
          //   title: Text("My Purchace"),
          //   onTap: () {},
          // ),
          ListTile(
            leading: Icon(Icons.add_chart),
            title: Text("My Sales"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MainView(initRoute: 7)),
                      (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("IMI Tracker"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MainView(initRoute: 8)),
                      (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.currency_rupee_rounded),
            title: Text("Price List"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MainView(initRoute: 9)),
                      (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.currency_rupee_rounded),
            title: Text("Schemes"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MainView(initRoute: 10)),
                      (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.currency_rupee_rounded),
            title: Text("Price Drops"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MainView(initRoute: 11)),
                      (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.currency_rupee_rounded),
            title: Text("Profit and Loss"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MainView(initRoute: 12)),
                      (route) => false);
            },
          ),
          ExpansionTile(
            title: Text("CUSTOMER RELATIONS"),
            leading: Icon(Icons.person_search),
            childrenPadding: EdgeInsets.only(left: 70),
            children: [
              ListTile(
                title: Text("My Customers"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MainView(initRoute: 13)),
                          (route) => false);
                },
              ),
              ListTile(
                title: Text("My Distributors"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MainView(initRoute: 14)),
                          (route) => false);
                },
              )
            ],
          ),
          ExpansionTile(
            title: Text("SCHEMES MGMT"),
            leading: Icon(Icons.bar_chart),
            childrenPadding: EdgeInsets.only(left: 70),
            children: [
              ListTile(
                title: Text("Schemes dashBoard"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MainView(initRoute: 15)),
                          (route) => false);
                },
              ),
              ListTile(
                title: Text("Add your Screens"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MainView(initRoute: 16)),
                          (route) => false);
                },
              ),
              ListTile(
                title: Text("My Earnings"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MainView(initRoute: 17)),
                          (route) => false);
                },
              ),
              ListTile(
                title: Text("My Retailer Types"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MainView(initRoute: 18)),
                          (route) => false);
                },
              )
            ],
          ),
          ExpansionTile(
            title: Text("STAFF MNGMT"),
            leading: Icon(Icons.receipt_long),
            childrenPadding: EdgeInsets.only(left: 70),
            children: [
              ListTile(
                title: Text("My Staff"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MainView(initRoute: 19)),
                          (route) => false);
                },
              ),
              ListTile(
                title: Text("My Approvals"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MainView(initRoute: 20)),
                          (route) => false);
                },
              ),
              ListTile(
                title: Text("Branch Managment"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MainView(initRoute: 22)),
                          (route) => false);
                },
              ),
              ListTile(
                title: Text("Transfer Challans"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MainView(initRoute: 23)),
                          (route) => false);
                },
              )
            ],
          ),
        ]),
      );
    }else if(permission == "purchase"){
      return  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          ExpansionTile(
            title: Text("MY INVOICES"),
            leading: Icon(Icons.receipt_long),
            childrenPadding: EdgeInsets.only(left: 70),
            children: [
              ListView.builder(
                  itemCount: titleListpur.length,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  shrinkWrap: true,
                  itemBuilder: (Buildcontext,index){
                    return ListTile(
                      title: Text(titleListpur[index]),
                      onTap:(){
                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MainView(initRoute: index)),
                                (route) => false);
                      } ,
                    );
                  })
            ],
          ),
          ListTile(
            leading: Icon(Icons.edit_document),
            title: Text("Ledger"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text("My Purchace"),
            onTap: () {},
          ),
          // ListTile(
          //   leading: Icon(Icons.add_chart),
          //   title: Text("My Sales"),
          //   onTap: () {},
          // ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("IMI Tracker"),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.currency_rupee_rounded),
            title: Text("Price List"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.currency_rupee_rounded),
            title: Text("Schemes"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.currency_rupee_rounded),
            title: Text("Price Drops"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.currency_rupee_rounded),
            title: Text("Profit and Loss"),
            onTap: () {},
          ),
          ExpansionTile(
            title: Text("CUSTOMER RELATIONS"),
            leading: Icon(Icons.person_search),
            childrenPadding: EdgeInsets.only(left: 70),
            children: [
              ListTile(
                title: Text("My Customers"),
                onTap: () {},
              ),
              ListTile(
                title: Text("My Distributors"),
                onTap: () {},
              )
            ],
          ),
          ExpansionTile(
            title: Text("SCHEMES MGMT"),
            leading: Icon(Icons.bar_chart),
            childrenPadding: EdgeInsets.only(left: 70),
            children: [
              ListTile(
                title: Text("Schemes dashBoard"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Add your Screens"),
                onTap: () {},
              ),
              ListTile(
                title: Text("My Earnings"),
                onTap: () {},
              ),
              ListTile(
                title: Text("My Retailer Types"),
                onTap: () {},
              )
            ],
          ),
          ExpansionTile(
            title: Text("STAFF MNGMT"),
            leading: Icon(Icons.receipt_long),
            childrenPadding: EdgeInsets.only(left: 70),
            children: [
              ListTile(
                title: Text("My Staff"),
                onTap: () {},
              ),
              ListTile(
                title: Text("My Approvals"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Branch Managment"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Transfer Challans"),
                onTap: () {},
              )
            ],
          ),
        ]),
      );
    }
    return  SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(children: [
        ExpansionTile(
          title: Text("MY INVOICES"),
          leading: Icon(Icons.receipt_long),
          childrenPadding: EdgeInsets.only(left: 70),
          children: [
            ListTile(
              leading: Icon(Icons.edit_document),
              title: Text("Sales Invoice"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 1)),
                        (route) => false);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text("Purchace Invoice"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 2)),
                        (route) => false);
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.add_chart),
            //   title: Text("My Sales"),
            //   onTap: () {},
            // ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Invoice settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 3)),
                        (route) => false);
              },
            ),
            ListTile(
              leading: Icon(Icons.currency_rupee_rounded),
              title: Text("Invoice dashboard"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 4)),
                        (route) => false);
              },
            ),
          ],
        ),
        ListTile(
          leading: Icon(Icons.edit_document),
          title: Text("Ledger"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => MainView(initRoute: 5)),
                    (route) => false);
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_bag_outlined),
          title: Text("My Purchace"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => MainView(initRoute: 6)),
                    (route) => false);

          },
        ),
        ListTile(
          leading: Icon(Icons.add_chart),
          title: Text("My Sales"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => MainView(initRoute: 7)),
                    (route) => false);
          },
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: Text("IMEI Tracker"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => MainView(initRoute: 8)),
                    (route) => false);
          },
        ),
        ListTile(
          leading: Icon(Icons.currency_rupee_rounded),
          title: Text("Price List"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => MainView(initRoute: 9,)),
                    (route) => false);
          },
        ),
        ListTile(
          leading: Icon(Icons.currency_rupee_rounded),
          title: Text("Schemes"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => MainView(initRoute: 10)),
                    (route) => false);
          },
        ),
        ListTile(
          leading: Icon(Icons.currency_rupee_rounded),
          title: Text("Price Drops"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.currency_rupee_rounded),
          title: Text("Profit and Loss"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => MainView(initRoute: 12)),
                    (route) => false);
          },
        ),
        ExpansionTile(
          title: Text("CUSTOMER RELATIONS"),
          leading: Icon(Icons.person_search),
          childrenPadding: EdgeInsets.only(left: 70),
          children: [
            ListTile(
              title: Text("My Customers"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 13)),
                        (route) => false);
              },
            ),
            ListTile(
              title: Text("My Distributors"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 14)),
                        (route) => false);
              },
            )
          ],
        ),
        ExpansionTile(
          title: Text("SCHEMES MGMT"),
          leading: Icon(Icons.bar_chart),
          childrenPadding: EdgeInsets.only(left: 70),
          children: [
            ListTile(
              title: Text("Schemes dashBoard"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 15)),
                        (route) => false);
              },
            ),
            ListTile(
              title: Text("Add your Screens"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 16)),
                        (route) => false);
              },
            ),
            ListTile(
              title: Text("My Earnings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 16)),
                        (route) => false);
              },
            ),
            ListTile(
              title: Text("My Retailer Types"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 17)),
                        (route) => false);
              },
            )
          ],
        ),
        ExpansionTile(
          title: Text("STAFF MNGMT"),
          leading: Icon(Icons.receipt_long),
          childrenPadding: EdgeInsets.only(left: 70),
          children: [
            ListTile(
              title: Text("My Staff"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 18)),
                        (route) => false);
              },
            ),
            ListTile(
              title: Text("My Approvals"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 19)),
                        (route) => false);
              },
            ),
            ListTile(
              title: Text("Branch Managment"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute:20)),
                        (route) => false);
              },
            ),
            ListTile(
              title: Text("Transfer Challans"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(initRoute: 21)),
                        (route) => false);
              },
            )
          ],
        ),
      ]),
    );
  }
  Widget Listtile({required String title,ontap}){
    return ListTile(
      title: Text(title),
      onTap: ontap,
    );
  }
  final titleListpur =["Purchace Invoice","Invoice Seeting","Invoice dashboard"];
  final titleListsal =["Sales Invoice","Invoice Seeting","Invoice dashboard"];
  final titleListboth =["Sales Invoice","Purchace Invoice","Invoice Seeting","Invoice dashboard"];
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
              getScreen(""),
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
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ListTile(
// title: Text("Sales  invoice"),
// onTap: () {
// Navigator.pop(context);
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (_) => MainView(initRoute: 1)),
// (route) => false);
// },
// ),
// ListTile(
// title: Text("Purchace invoice"),
// onTap: () {
// Navigator.pop(context);
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (_) => MainView(initRoute: 2)),
// (route) => false);
// },
// ),
// ListTile(
// title: Text("Invoice Settings"),
// onTap: () {
// Navigator.pop(context);
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (_) => MainView(initRoute: 3)),
// (route) => false);
// },
// ),
// ListTile(
// title: Text("Invoice Dashboard"),
// onTap: () {
// Navigator.pop(context);
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (_) => MainView(initRoute: 0)),
// (route) => false);
// },
// ),
