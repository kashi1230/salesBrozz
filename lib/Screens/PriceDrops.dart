import 'package:flutter/material.dart';

class PriceDropsScreen extends StatefulWidget {
  @override
  _PriceDropsScreenState createState() => _PriceDropsScreenState();
}

class _PriceDropsScreenState extends State<PriceDropsScreen> {
  int _selectedMonthIndex = DateTime.now().month - 1; // Current month
  int _selectedYear = DateTime.now().year;

  List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  List<int> years = List.generate(5, (index) => DateTime.now().year - 2 + index); // Last 5 years

  List<PriceDrop> priceDrops = [
    PriceDrop('Item 1', DateTime(2022, 1, 10), 50.0, 45.0),
    PriceDrop('Item 2', DateTime(2022, 1, 15), 100.0, 80.0),
    PriceDrop('Item 3', DateTime(2022, 2, 5), 120.0, 110.0),
    PriceDrop('Item 4', DateTime(2022, 3, 20), 80.0, 75.0),
    PriceDrop('Item 5', DateTime(2022, 3, 25), 150.0, 130.0),
  ];

  List<PriceDrop> getPriceDropsForMonth(int monthIndex) {
    return priceDrops.where((priceDrop) => priceDrop.date.month == monthIndex + 1 && priceDrop.date.year == _selectedYear).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(months.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedMonthIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: _selectedMonthIndex == index ? Colors.blue : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      months[index],
                      style: TextStyle(
                        color: _selectedMonthIndex == index ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 16.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(years.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedYear = years[index];
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: _selectedYear == years[index] ? Colors.blue : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      years[index].toString(),
                      style: TextStyle(
                        color: _selectedYear == years[index] ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: getPriceDropsForMonth(_selectedMonthIndex).isEmpty
                ? Center(
              child: Text(
                'No price drops for selected month',
                style: TextStyle(fontSize: 16.0),
              ),
            )
                : ListView.builder(
              itemCount: getPriceDropsForMonth(_selectedMonthIndex).length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: PriceDropCard(priceDrop: getPriceDropsForMonth(_selectedMonthIndex)[index]),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          Center(
            child: Text(
              'Total Price Drops: ${getPriceDropsForMonth(_selectedMonthIndex).length}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class PriceDrop {
  final String itemName;
  final DateTime date;
  final double originalPrice;
  final double newPrice;

  PriceDrop(this.itemName, this.date, this.originalPrice, this.newPrice);
}

class PriceDropCard extends StatelessWidget {
  final PriceDrop priceDrop;

  const PriceDropCard({required this.priceDrop}) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1.0,
      shape: LinearBorder(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              priceDrop.itemName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Original Price: \$${priceDrop.originalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'New Price: \$${priceDrop.newPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Date: ${priceDrop.date.day}/${priceDrop.date.month}/${priceDrop.date.year}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
