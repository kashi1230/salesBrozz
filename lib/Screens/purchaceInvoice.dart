import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purchase Invoices',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PurchaseInvoiceScreen(),
    );
  }
}

class PurchaseInvoiceScreen extends StatelessWidget {
  // Sample list of purchase invoices
  final List<PurchaseInvoice> purchaseInvoices = [
    PurchaseInvoice(id: 'INV001', amount: 100, date: '2024-03-28', customerName: 'John Doe'),
    PurchaseInvoice(id: 'INV002', amount: 150, date: '2024-03-27', customerName: 'Alice Smith'),
    PurchaseInvoice(id: 'INV003', amount: 200, date: '2024-03-26', customerName: 'Bob Johnson'),
    // Add more invoices as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Invoices'),
      ),
      body: ListView.builder(
        itemCount: purchaseInvoices.length,
        itemBuilder: (context, index) {
          final invoice = purchaseInvoices[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date: ${invoice.date}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Invoice No.: ${invoice.id}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Customer Name: ${invoice.customerName}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Price: \$${invoice.amount.toString()}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Model class representing a Purchase Invoice
class PurchaseInvoice {
  final String id;
  final double amount;
  final String date;
  final String customerName;

  PurchaseInvoice({required this.id, required this.amount, required this.date, required this.customerName});
}
