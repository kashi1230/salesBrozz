import '../../imports.dart';
import '../../widgets/Common Widgets/iconButton.dart';

class PurchaceInvoiceScreen extends StatelessWidget {
  // Sample list of sales invoices
  final List<SalesInvoice> salesInvoices = [
    SalesInvoice(
        id: 'INV001',
        amount: 100,
        date: '2024-03-28',
        customerName: 'John Doe'),
    SalesInvoice(
        id: 'INV002',
        amount: 150,
        date: '2024-03-27',
        customerName: 'Alice Smith'),
    SalesInvoice(
        id: 'INV003',
        amount: 200,
        date: '2024-03-26',
        customerName: 'Bob Johnson'),
    // Add more invoices as needed
  ];

  PurchaceInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Invoice',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: salesInvoices.length,
              itemBuilder: (context, index) {
                final invoice = salesInvoices[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: LinearBorder(),
                    color: Colors.white,
                    elevation: 2.0,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('Date -> ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("${invoice.date}")
                            ],
                          ),
                          Row(
                            children: [
                              Text('Bill No -> ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("${invoice.id}")
                            ],
                          ),
                          Row(
                            children: [
                              Text('Vendor Name -> ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("${invoice.customerName}")
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Vendor phn -> ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("9685716342")
                            ],
                          ),
                          Row(
                            children: [
                              Text('Ammount -> ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("\$${invoice.amount.toString()}")
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Paid -> ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.check)
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Payment Mood -> ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Cash")
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 18),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    'View More',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ResizableRoundedIconButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                icon: Icons.download,
                                iconSize: 18.0,
                                buttonSize: 35.0,
                                borderRadius: 20.0,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
  SalesInvoice(
      {required this.id,
      required this.amount,
      required this.date,
      required this.customerName});
}
