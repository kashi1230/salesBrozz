import 'package:flutter/material.dart';

class PurchaseInvoicesScreen extends StatefulWidget {
  @override
  _PurchaseInvoicesScreenState createState() => _PurchaseInvoicesScreenState();
}

class _PurchaseInvoicesScreenState extends State<PurchaseInvoicesScreen> {
  List<PurchaseInvoice> invoices = [
    PurchaseInvoice(
      billNo: 'INV-001',
      vendor: 'Acme Inc.',
      amount: 200.00,
      paid: true,
    ),
    PurchaseInvoice(
      billNo: 'INV-002',
      vendor: 'Beta Corp.',
      amount: 500.00,
      paid: false,
    ),
    PurchaseInvoice(
      billNo: 'INV-003',
      vendor: 'Gamma LLC',
      amount: 1000.00,
      paid: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Invoices'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: invoices.length,
                    itemBuilder: (context, index) {
                      final invoice = invoices[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 16.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              invoice.billNo,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              invoice.vendor,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${invoice.amount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: invoice.paid ? Colors.green : Colors.red,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    invoice.paid ? 'Paid' : 'Unpaid',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PurchaseInvoice {
  final String billNo;
  final String vendor;
  final bool paid;
  final double amount;

  PurchaseInvoice({
    required this.billNo,
    required this.vendor,
    required this.paid,
    required this.amount,
  });
}