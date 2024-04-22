import 'package:flutter/material.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/textfeild.dart';
import 'package:intl/intl.dart';

import '../widgets/Common Widgets/Button.dart';

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
  final count = [50, 20, 30];

  final totalval = [5000.0, 2000.1, 3000.0];

  final name = ["Accesories", "Mobile", "Overall"];

  final List<Color> colors = [Colors.orange, Colors.green, Colors.yellow];

  final int accessoriesCount = 50;

  final double accessoriesValue = 5000.0;

  final int mobilesCount = 20;

  final double mobilesValue = 25000.0;

  final int electronicsCount = 30;

  final double electronicsValue = 30000.0;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("Filter By Brands"), value: "Filter By Brands"),
      DropdownMenuItem(child: Text("Oppo"), value: "Oppo"),
      DropdownMenuItem(child: Text("Vivo"), value: "Vivo"),
      DropdownMenuItem(child: Text("Samsung"), value: "samsung"),
    ];
    return menuItems;
  }

  String selectedValue = "Filter By Brands";

  late DateTime _startDate;
  late DateTime _endDate;
  TextEditingController _dateRangeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _endDate = DateTime.now();
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
        _dateRangeController.text =
            '${DateFormat('MM/dd/yyyy').format(_startDate)} - ${DateFormat('MM/dd/yyyy').format(_endDate)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            padding: EdgeInsets.symmetric(horizontal: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 1.9,
            ),
            itemCount: 3,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                  color: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.black,
                  child: CustomCard(
                    title: name[index],
                    count: count[index],
                    value: totalval[index],
                    color: colors[index],
                  ));
            },
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 0),
                child: DropdownButton(
                  value: selectedValue,
                  items: dropdownItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, left: 50, right: 2),
                child: Row(
                  children: [
                    DropdownButton<String>(
                      value: _selectedOption1,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption1 = newValue!;
                        });
                      },
                      items: _options1
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    DropdownButton<String>(
                      value: _selectedOption2,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption2 = newValue!;
                        });
                      },
                      items: _options2
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text("This Week ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 3,
                    ),
                    Text("|",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 2,
                    ),
                    Text("Today",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () => _selectDateRange(context),
                  child: AbsorbPointer(
                    child: SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: _dateRangeController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.date_range),
                          labelText: 'Date Range',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: HButton(text: "Export To Excel")),
              SizedBox(height: 20,),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:10.0),
                child:Container(
                  height:1.0,
                  width:500,
                  color:Colors.black,),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Showing Purchase Data In Selected Range",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:10.0),
                child:Container(
                  height:1.0,
                  width:600,
                  color:Colors.black,),),
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: DataTable(
                        // Datatable widget that have the property columns and rows.
                        columns: [
                          // Set the name of the column
                          DataColumn(
                            label: Text('Brand'),
                          ),
                          DataColumn(
                            label: Column(
                              children: [
                                Text('Total'),
                                Text('Value'),
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              children: [
                                Text('Total'),
                                Text('Count'),
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              children: [
                                Text('See'),
                                Text('More'),
                              ],
                            ),
                          ),
                        ],
                        rows: [
                          // Set the values to the columns
                          DataRow(cells: [
                            DataCell(Text("1")),
                            DataCell(Text("Alex")),
                            DataCell(Text("Anderson")),
                            DataCell(Text("18")),
                          ]),
                          DataRow(cells: [
                            DataCell(Text("2")),
                            DataCell(Text("John")),
                            DataCell(Text("Anderson")),
                            DataCell(Text("24")),
                          ]),
                          DataRow(cells: [
                            DataCell(Text("1")),
                            DataCell(Text("Alex")),
                            DataCell(Text("Anderson")),
                            DataCell(Text("18")),
                          ]),
                          DataRow(cells: [
                            DataCell(Text("1")),
                            DataCell(Text("Alex")),
                            DataCell(Text("Anderson")),
                            DataCell(Text("18")),
                          ]),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final int count;
  final double value;
  final Color color;

  const CustomCard({
    super.key,
    required this.title,
    required this.count,
    required this.value,
    required this.color,
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
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Total Count -"), Text('$count')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Total value -"), Text("${value}")],
                ),
              ],
            ),
          ),
        ));
  }
}
