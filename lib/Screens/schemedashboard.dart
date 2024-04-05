import 'package:flutter/material.dart';


class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController _dateRangeController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void dispose() {
    _dateRangeController.dispose();
    super.dispose();
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
        _dateRangeController.text =
        '${_startDate!.toString().substring(0, 10)} - ${_endDate!.toString().substring(0, 10)}';
      });
    }
  }

  bool showTopBrandEarnings = false;

  bool showTopProductEarnings = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBox(Colors.red, Icons.shopping_cart, "2500",'Total Eligible Scheme',),
                _buildBox(Colors.green, Icons.bar_chart, "35000",'Total Scheme earnings'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBox(Colors.blue, Icons.trending_down_rounded, "45000",'Total Selling Ammount'),
                _buildBox(Colors.orange, Icons.notifications, "3400",'Total SellOut Ammount'),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: 320,
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
                onPressed: () {
                  setState(() {
                    showTopBrandEarnings = !showTopBrandEarnings;
                    showTopProductEarnings = false; // Hide other container
                  });
                },
                child: Text('Top Brand Earnings',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
              ),
            ),
            SizedBox(height:10),
            Container(
              height: 50,
              width: 320,
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
                onPressed: () {
                  setState(() {
                    showTopProductEarnings = !showTopProductEarnings;
                    showTopBrandEarnings = false; // Hide other container
                  });
                },
                child: Text('Top Product Earnings',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    if (showTopBrandEarnings)
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Top Brand Earnings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            _buildTable(),
                          ],
                        ),
                      ),
                    if (showTopProductEarnings)
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Top Product Earnings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            _buildTable(),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildTable() {
    return Table(
      border: TableBorder.all(color: Colors.white),
      children: [
        TableRow(
          children: [
            TableCell(child: _buildTableCell('ID')),
            TableCell(child: _buildTableCell('Top Brand')),
            TableCell(child: _buildTableCell('Earnings')),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: _buildTableCell('1')),
            TableCell(child: _buildTableCell('Brand A')),
            TableCell(child: _buildTableCell('\$500')),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: _buildTableCell('2')),
            TableCell(child: _buildTableCell('Brand B')),
            TableCell(child: _buildTableCell('\$800')),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: _buildTableCell('3')),
            TableCell(child: _buildTableCell('Brand C')),
            TableCell(child: _buildTableCell('\$1200')),
          ],
        ),
      ],
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

  Widget _buildBox(Color color, IconData icon, String text,String text2) {
    return Container(
      width: 150,
      height: 160,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
            child: Text(
              text2,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
