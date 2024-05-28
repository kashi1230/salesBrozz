import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/Button.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/textfeild.dart';
import '../../Get_x/Invoice _controller/Sales_controller.dart';
import '../../imports.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class SalesInvoiceScreen extends StatelessWidget {
  final SalesInvoiceController controller = Get.put(SalesInvoiceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(padding: EdgeInsets.all(8), child: searchbar()),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ArrowText(text: "Sales Invoices")),
          SizedBox(
            height: 10,
          ),
          Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                  shape: OutlineInputBorder(),
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Select')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Invoice No.')),
                      DataColumn(label: Text('Paid')),
                      DataColumn(label: Text('Customer Name')),
                      DataColumn(label: Text('Customer Phone')),
                      DataColumn(label: Text('Amount')),
                      DataColumn(label: Text('Pending Amount')),
                      DataColumn(label: Text('Payment Mode')),
                      DataColumn(label: Text('Products')),
                    ],
                    rows: List<DataRow>.generate(
                      controller.invoices.length,
                      (index) {
                        var invoice = controller.invoices[index];
                        return DataRow(cells: [
                          DataCell(
                            Checkbox(
                              value: invoice.paid,
                              onChanged: (value) {
                                controller.togglePaidStatus(index);
                              },
                            ),
                          ),
                          DataCell(Text(invoice.date)),
                          DataCell(Text(invoice.invoiceNo)),
                          DataCell(Text(invoice.paid ? 'Yes' : 'No')),
                          DataCell(Text(invoice.customerName)),
                          DataCell(Text(invoice.customerPhone)),
                          DataCell(Text(invoice.amount.toString())),
                          DataCell(Text(invoice.pendingAmount.toString())),
                          DataCell(Text(invoice.paymentMode)),
                          DataCell(FButton(title: "View",onpress: ()async{
                            // Generate and save the invoice PDF
                            final file = await generateAndSaveInvoice();
                            // Show a dialog or navigate to another screen upon completion
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Invoice Generated'),
                                content: Text('The sales invoice PDF has been generated. Do you want to open it?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('No'),
                                  ),
                                  TextButton(
                                  onPressed: () async {
                            // Request storage permission
                            final storagePermissionGranted = await _requestStoragePermission();
                            if (storagePermissionGranted) {
                            // Generate and save the invoice PDF
                            final file = await generateAndSaveInvoice();
                            // Open the PDF file
                            OpenFile.open(file.path);
                            } else {
                            // Handle case when permission is denied
                            }
                            },
                            child: Text('Yes'),
                                  ),
                                ],
                              ),
                            );

                          })),
                        ]);
                      },
                    ),
                  ),
                ),
              )),
          SizedBox(height: 5),
        ],
      ),
    );
  }
  Future<bool> _requestStoragePermission() async {
    // Request storage permission
    final status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else {
      print('Storage permission denied');
      return false;
    }
  }

  Future<File> generateAndSaveInvoice() async {
    // Get the document directory using path_provider package
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final fontData = await rootBundle.load('assets/fonts/k.ttf');
    final ttf = pw.Font.ttf(fontData.buffer.asByteData());

    // Define invoice data
    final date = '2024-04-23';
    final invoiceNo = 'INV001';
    final customerName = 'John Doe';
    final amount = 100.0;

    final pdf = pw.Document();
    
    final pw.TextStyle titleStyle =pw.TextStyle(font: ttf, fontSize: 20);
    final pw.TextStyle headerStyle = pw.TextStyle(font: ttf, fontSize: 20);
    final pw.TextStyle textStyle =pw.TextStyle(font: ttf, fontSize: 20);

    // Add content to the PDF
    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Center(
            child: pw.Text('Sales Invoice', style: titleStyle),
          ),
          pw.SizedBox(height: 20),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Date:', style: headerStyle),
              pw.Text(date, style: textStyle),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Invoice No:', style: headerStyle),
              pw.Text(invoiceNo, style: textStyle),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Customer Name:', style: headerStyle),
              pw.Text(customerName, style: textStyle),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Amount:', style: headerStyle),
              pw.Text('\$$amount', style: textStyle),
            ],
          ),
        ],
      ),
    );

    // Save the PDF to a file
    final file = File('$appDocPath/sales_invoice.pdf');
    await file.writeAsBytes(await pdf.save());

    return file;
  }

}
