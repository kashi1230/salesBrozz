import 'package:get/get.dart';

class SalesInvoiceController extends GetxController {
  var invoices = <Invoice>[
    Invoice(
      date: '2024-04-23',
      invoiceNo: 'INV001',
      paid: false,
      customerName: 'John Doe',
      customerPhone: '1234567890',
      amount: 100.0,
      pendingAmount: 50.0,
      paymentMode: 'Cash',
      products: 'Product A',
    ),
    // Add more invoices as needed
  ].obs;
  void togglePaidStatus(int index) {
    var invoice = invoices[index];
    invoice.paid = !invoice.paid;
    invoices[index] = invoice;  // Updates the observable list to trigger UI changes
    update();
  }
}
class Invoice {
  String date;
  String invoiceNo;
  bool paid;
  String customerName;
  String customerPhone;
  double amount;
  double pendingAmount;
  String paymentMode;
  String products;

  Invoice({
    required this.date,
    required this.invoiceNo,
    required this.paid,
    required this.customerName,
    required this.customerPhone,
    required this.amount,
    required this.pendingAmount,
    required this.paymentMode,
    required this.products,
  });
}
