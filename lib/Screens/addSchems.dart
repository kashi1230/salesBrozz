import 'package:flutter/material.dart';


class Scheme {
  final String schemeName;
  final String brand;
  final String inactiveType;
  final String targetType;
  final DateTime periodFrom;
  final DateTime periodTo;
  final String product;

  Scheme({
    required this.schemeName,
    required this.brand,
    required this.inactiveType,
    required this.targetType,
    required this.periodFrom,
    required this.periodTo,
    required this.product,

  });
}


class SchemeScreen extends StatefulWidget {
  @override
  _SchemeScreenState createState() => _SchemeScreenState();
}

class _SchemeScreenState extends State<SchemeScreen> {
  List<Scheme> schemes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        _navigateToAddScheme(context);
                      },
                      child: Text('Add Scheme',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Avalible Schemes ↓",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder(),
                  columns: [
                    DataColumn(label: Text('Scheme Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                    DataColumn(label: Text('Brand',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                    DataColumn(label: Text('Inactive Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                    DataColumn(label: Text('Target Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                    DataColumn(label: Text('Period From',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                    DataColumn(label: Text('Period To',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                    DataColumn(label: Text('Product',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                  ],
                  rows: schemes.map((scheme) {
                    return DataRow(cells: [
                      DataCell(Text(scheme.schemeName)),
                      DataCell(Text(scheme.brand)),
                      DataCell(Text(scheme.inactiveType)),
                      DataCell(Text(scheme.targetType)),
                      DataCell(Text(scheme.periodFrom.toString())),
                      DataCell(Text(scheme.periodTo.toString())),
                      DataCell(Text(scheme.product.toString())),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAddScheme(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddSchemeScreen()),
    );

    if (result != null && result is Scheme) {
      setState(() {
        schemes.add(result);
      });
    }
  }
}

class AddSchemeScreen extends StatefulWidget {
  @override
  _AddSchemeScreenState createState() => _AddSchemeScreenState();
}

class _AddSchemeScreenState extends State<AddSchemeScreen> {
  late TextEditingController _schemeNameController;
  late TextEditingController _brandController;
  late TextEditingController _inactiveTypeController;
  late TextEditingController _targetTypeController;
  late TextEditingController _periodFromController;
  late TextEditingController _periodToController;
  late TextEditingController _addproductController;

  @override
  void initState() {
    super.initState();
    _schemeNameController = TextEditingController();
    _brandController = TextEditingController();
    _inactiveTypeController = TextEditingController();
    _targetTypeController = TextEditingController();
    _periodFromController = TextEditingController();
    _periodToController = TextEditingController();
    _addproductController = TextEditingController();
  }

  @override
  void dispose() {
    _schemeNameController.dispose();
    _brandController.dispose();
    _inactiveTypeController.dispose();
    _targetTypeController.dispose();
    _periodFromController.dispose();
    _periodToController.dispose();
    _addproductController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Scheme'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _schemeNameController,
                decoration: InputDecoration(labelText: 'Scheme Name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _brandController,
                decoration: InputDecoration(labelText: 'Brand'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _inactiveTypeController,
                decoration: InputDecoration(labelText: 'Inactive Type'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _targetTypeController,
                decoration: InputDecoration(labelText: 'Target Type'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _periodFromController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    labelText: 'DD/MM/YY'),
                onTap: () => _selectDate(context, _periodFromController),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _periodToController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    labelText: 'DD/MM/YY'
                ),
                onTap: () => _selectDate(context, _periodToController),
              ),
              SizedBox(height: 20),
              TextField(

                controller: _addproductController,
                decoration: InputDecoration(
                    labelText: 'Add Product'
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  _saveScheme();
                },
                child: Text('Save Scheme',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        controller.text = picked.toString().substring(0, 10);
      });
    }
  }

  void _saveScheme() {
    final scheme = Scheme(
      schemeName: _schemeNameController.text,
      brand: _brandController.text,
      inactiveType: _inactiveTypeController.text,
      targetType: _targetTypeController.text,
      periodFrom: DateTime.parse(_periodFromController.text),
      periodTo: DateTime.parse(_periodToController.text),
      product :_addproductController.text
    );

    Navigator.pop(context, scheme);
  }
}
