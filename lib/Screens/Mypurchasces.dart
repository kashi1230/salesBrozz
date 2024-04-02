import 'package:flutter/material.dart';
import 'package:salesbrozz/Screens/InvoiceSetting.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/commonWidget.dart';


class MyPurchase extends StatefulWidget {

  const MyPurchase({super.key});

  @override
  State<MyPurchase> createState() => _MyPurchaseState();
}

class _MyPurchaseState extends State<MyPurchase> {
  String _selectedOption1 = '2024';
  String _selectedOption2 = 'March';

  List<String> _options1 = ['2024', "2023", '2022'];
  List<String> _options2 = ["March", 'february', 'january'];
  final count =[
    50,
    20,
    30
  ];

  final totalval =[
    5000.0,
    2000.1,
    3000.0
  ];

  final name =[
    "Accesories",
    "Mobile",
    "Electronics"
  ];

  final List<Color> colors =[
    Colors.orange,
    Colors.green,
    Colors.yellow
  ];

  final int accessoriesCount = 50;

  final double accessoriesValue = 5000.0;

  final int mobilesCount = 20;

  final double mobilesValue = 25000.0;

  final int electronicsCount = 30;

  final double electronicsValue = 30000.0;

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Filter By Brands"),value: "Filter By Brands"),
      DropdownMenuItem(child: Text("Oppo"),value: "Oppo"),
      DropdownMenuItem(child: Text("Vivo"),value: "Vivo"),
      DropdownMenuItem(child: Text("Samsung"),value: "samsung"),
    ];
    return menuItems;
  }

  String selectedValue = "Filter By Brands";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Search',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
          ),
        ),
            ),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 1.9,
              ),
              itemCount: 3,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomCard(title: name[index] ,count: count[index], value:totalval[index],color: colors[index],);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 0),
              child: DropdownButton(
                value: selectedValue,
                items: dropdownItems,
                onChanged: (String? newValue){
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2,left: 50,right: 2),
              child: Row(
                children: [
                  DropdownButton<String>(
                    value: _selectedOption1,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption1 = newValue!;
                      });
                    },
                    items: _options1.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 3,),
                  DropdownButton<String>(
                    value: _selectedOption2,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption2 = newValue!;
                      });
                    },
                    items: _options2.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 3,),
                  Text("This Week ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                  SizedBox(width: 3,),
                  Text("|",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                  SizedBox(width: 2,),
                  Text("Today",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
                child: HButton(text: "Export To Excel"))
      ]
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final int count;
  final double value;
  final Color color;

  const CustomCard({super.key,
    required this.title,
    required this.count,
    required this.value, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    const double _cardWidth = 180;
    return SizedBox(
        width: _cardWidth,
        height: 145,
        child: Card(
          color: color,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Total Count -"),
                  Text('$count')
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Total value -"),
                  Text("${value}")
                ],),

              ],
            ),
          ),
        ));
  }
}

