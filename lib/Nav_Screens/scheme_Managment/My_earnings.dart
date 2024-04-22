import 'package:flutter/material.dart';

import '../../widgets/text/textbuilder.dart';

class Scheme {
  final String schemeName;
  final double earnings;

  Scheme(this.schemeName, this.earnings);
}

class Brand {
  final String brandName;
  final double earnings;

  Brand(this.brandName, this.earnings);
}

class Product {
  final String productName;
  final double earnings;

  Product(this.productName, this.earnings);
}
class EarningsDashboard extends StatefulWidget {
  @override
  _EarningsDashboardState createState() => _EarningsDashboardState();
}

class _EarningsDashboardState extends State<EarningsDashboard> {
  int _selectedIndex = 0;

  List<Scheme> schemes = [
    Scheme('Scheme A', 1000),
    Scheme('Scheme B', 1500),
    Scheme('Scheme C', 2000),
  ];

  List<Brand> brands = [
    Brand('Brand X', 500),
    Brand('Brand Y', 800),
    Brand('Brand Z', 1200),
  ];

  List<Product> products = [
    Product('Product 1', 200),
    Product('Product 2', 300),
    Product('Product 3', 400),
  ];

  String _selectedBrand = 'All';
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7)); // Default end date is 7 days from now

  List<String> _brands = ['All', 'Brand 1', 'Brand 2', 'Brand 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              child: Card(color: Colors.white,
                shape: LinearBorder(),
                elevation: 0.6,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildHeading('Scheme Earning', 0),
                    _buildHeading('Brand Earning', 1),
                    _buildHeading('Product Earning', 2),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedBrand,
                      onChanged: (value) {
                        setState(() {
                          _selectedBrand = value!;
                        });
                      },
                      items: _brands.map<DropdownMenuItem<String>>((String brand) {
                        return DropdownMenuItem<String>(
                          value: brand,
                          child: Text(brand),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Filter by Brand',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _selectStartDate(context);
                            },
                            child: Text('Start Date: ${_startDate.day}/${_startDate.month}/${_startDate.year}'),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _selectEndDate(context);
                            },
                            child: Text('End Date: ${_endDate.day}/${_endDate.month}/${_endDate.year}'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.white,
                  shape: OutlineInputBorder(),
                  child: DataTable(
                    columns: [
                      DataColumn(label: TextBuilder(text:'Name',fontSize: 16,fontWeight: FontWeight.bold,)),
                      DataColumn(label: TextBuilder(text:"Earnings",fontSize: 16,fontWeight: FontWeight.bold,)),
                      DataColumn(label: TextBuilder(text:'Actions',fontSize: 16,fontWeight: FontWeight.bold,)),
                    ],
                    rows: _selectedIndex == 0
                        ? schemes.map((scheme) {
                      return DataRow(cells: [
                        DataCell(Text(scheme.schemeName)),
                        DataCell(Text(scheme.earnings.toString())),
                        DataCell(Text('Actions')),
                      ]);
                    }).toList()
                        : _selectedIndex == 1
                        ? brands.map((brand) {
                      return DataRow(cells: [
                        DataCell(Text(brand.brandName)),
                        DataCell(Text(brand.earnings.toString())),
                        DataCell(Text('Actions')),
                      ]);
                    }).toList()
                        : products.map((product) {
                      return DataRow(cells: [
                        DataCell(Text(product.productName)),
                        DataCell(Text(product.earnings.toString())),
                        DataCell(Text('Actions')),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeading(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: _selectedIndex == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }


  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }
}
