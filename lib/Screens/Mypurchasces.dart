import 'package:flutter/material.dart';


class MyPurchase extends StatefulWidget {

  MyPurchase({super.key});

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
    50000.0,
    20000.1,
    300000.0
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
      body: Column(
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
          Expanded(
            child: GridView.builder(
              itemCount: 3,
              itemBuilder:(context ,index){
                return  CustomCard(
                  title: name[index],
                  count: count[index],
                  value: totalval[index],
                  color: colors[index],
                );
              }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: 1.5/1.6
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50,left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  value: selectedValue,
                  items: dropdownItems,
                  onChanged: (String? newValue){
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                ),
                Row(
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
                    Text("This Week ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                    SizedBox(width: 2,),
                    Text("Today",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          )
        ],
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
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 5,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Count: $count',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Total Value: \$${value.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}