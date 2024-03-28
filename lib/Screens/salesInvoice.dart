
import '../imports.dart';
class SalesInvoiceScreen extends StatelessWidget {
  // Sample list of sales invoices
  final List<SalesInvoice> salesInvoices = [
    SalesInvoice(id: 'INV001', amount: 100, date: '2024-03-28', customerName: 'John Doe'),
    SalesInvoice(id: 'INV002', amount: 150, date: '2024-03-27', customerName: 'Alice Smith'),
    SalesInvoice(id: 'INV003', amount: 200, date: '2024-03-26', customerName: 'Bob Johnson'),
    // Add more invoices as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Invoices'),
      ),
      body: ListView.builder(
        itemCount: salesInvoices.length,
        itemBuilder: (context, index) {
          final invoice = salesInvoices[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date: ${invoice.date}'),
                    Text('Invoice No.: ${invoice.id}'),
                    Text('Customer Name: ${invoice.customerName}'),
                    Text('Price: \$${invoice.amount.toString()}'),
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

// Model class representing a Sales Invoice
class SalesInvoice {
  final String id;
  final double amount;
  final String date;
  final String customerName;
  SalesInvoice({required this.id, required this.amount, required this.date, required this.customerName});
}
