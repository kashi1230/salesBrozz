import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDF extends StatefulWidget {
  @override
  _PDFState createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  File? _pdfFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Invoice Generator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                File pdfFile = await pdf(
                  _nameController.text,
                  _addressController.text,
                  _dateController.text,
                  int.tryParse(_quantityController.text) ?? 0,
                );
                setState(() {
                  _pdfFile = pdfFile;
                });
              },
              child: Text('Generate PDF'),
            ),
            SizedBox(height: 20),
            if (_pdfFile != null)
              ElevatedButton(
                onPressed: () {
                  Printing.layoutPdf(onLayout: (_) => _pdfFile!.readAsBytes());
                },
                child: Text('Open PDF'),
              ),
          ],
        ),
      ),
    );
  }

  // Future<File> generatePDF(String name, String address, String date, int quantity) async {
  //   final pdf = pw.Document();
  //
  //   final ByteData imageData = await rootBundle.load('assets/images/flutter.png');
  //   final Uint8List uint8List = imageData.buffer.asUint8List();
  //   final image = pw.MemoryImage(uint8List);
  //   // final PdfImage logoImage = PdfImage(
  //   //  pdf.document,
  //   //   image: uint8List,
  //   //   width: 10,
  //   //   height: 20
  //   // );
  //
  //   pdf.addPage(
  //     pw.Page(
  //       pageFormat: PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
  //       margin: pw.EdgeInsets.all(20),
  //       orientation: pw.PageOrientation.portrait,
  //       build: (pw.Context context) {
  //         return pw.ListView(
  //           children: <pw.Widget>[
  //             pw.Container(
  //               padding: pw.EdgeInsets.only(bottom: 20),
  //               alignment: pw.Alignment.center,
  //               child: pw.Text("Tax Invoice", style: pw.TextStyle(color: PdfColors.red, fontSize: 30)),
  //             ),
  //             pw.Container(
  //               height: 1.0,
  //               width: 600.0,
  //               color: PdfColors.red,
  //               margin: pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
  //             ),
  //             pw.Row(
  //               crossAxisAlignment: pw.CrossAxisAlignment.start,
  //               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //               children: <pw.Widget>[
  //                 pw.Container(
  //                   margin: pw.EdgeInsets.all(10),
  //                   child:pw.Image(image,height: 50, width: 50),
  //                 ),
  //                 pw.Column(
  //                   crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //                   children: <pw.Widget>[
  //                     pw.Container(
  //                       child: pw.Text("SNA SISTECH Pvt. Ltd", style: pw.TextStyle(color: PdfColors.red)),
  //                     ),
  //                     pw.Container(
  //                       child: pw.Text(
  //                         "SNA SISTECH\nShop No.5 , Vallabhnagar Avadhpuri,\nKhajurikalan, Bhopal, Madhya Pradesh\n462022\nIndia",
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 pw.SizedBox(height: 30, width: 30),
  //                 pw.Column(
  //                   crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //                   children: <pw.Widget>[
  //                     pw.SizedBox(height: 30),
  //                     pw.Container(child: pw.Text("GSTIN")),
  //                     pw.Container(child: pw.Text("State")),
  //                     pw.Container(child: pw.Text("Pan")),
  //                   ],
  //                 ),
  //                 pw.Column(
  //                   crossAxisAlignment: pw.CrossAxisAlignment.end,
  //                   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //                   children: <pw.Widget>[
  //                     pw.SizedBox(height: 30),
  //                     pw.Container(child: pw.Text(" 0727232387A8")),
  //                     pw.Container(child: pw.Text("07-Delhi")),
  //                     pw.Container(child: pw.Text("AAGCB9745G")),
  //                   ],
  //                 ),
  //                 pw.Column(
  //                   crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                   mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
  //                   children: <pw.Widget>[
  //                     pw.SizedBox(height: 30),
  //                     pw.Container(child: pw.Text("Invoice Date")),
  //                     pw.Container(child: pw.Text("Invoice No.")),
  //                     pw.Container(child: pw.Text("Refrence No.")),
  //                   ],
  //                 ),
  //                 pw.Column(
  //                   crossAxisAlignment: pw.CrossAxisAlignment.end,
  //                   mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
  //                   children: <pw.Widget>[
  //                     pw.SizedBox(height: 30),
  //                     pw.Container(child: pw.Text("12/07/2019")),
  //                     pw.Container(child: pw.Text("BNMK/2020/18")),
  //                     pw.Container(child: pw.Text("")),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             pw.Container(
  //               height: 1.0,
  //               width: 600.0,
  //               color: PdfColors.red,
  //               margin: pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
  //             ),
  //             // Add more content here...
  //           ],
  //         );
  //       },
  //     ),
  //   );
  //
  //   final output = await getApplicationDocumentsDirectory();
  //   final file = File("${output.path}/example.pdf");
  //   await file.writeAsBytes(await pdf.save());
  //   return file;
  // }
  Future<dynamic> pdf(String name, String address, String date, int quantity) async {
    print("$name, $address, $date, $quantity");
    final pdf = pw.Document();

    print('clicked');
    final ByteData bytes = await rootBundle.load('assets/images/flutter.png');
    final Uint8List logoImageData = bytes.buffer.asUint8List();
    final logoImage = pw.MemoryImage(logoImageData);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
        margin: pw.EdgeInsets.all(20),
        orientation: pw.PageOrientation.portrait,
        build: (pw.Context context) {
          return pw.ListView(
            children: <pw.Widget>[
              pw.Container(
                padding: pw.EdgeInsets.only(bottom: 20),
                alignment: pw.Alignment.center,
                child: pw.Text(
                  "Tax Invoice",
                  style: pw.TextStyle(color: PdfColors.red, fontSize: 30),
                ),
              ),
              pw.Container(
                height: 1.0,
                width: 600.0,
                color: PdfColors.red,
                margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: <pw.Widget>[
                  pw.Container(margin: pw.EdgeInsets.all(10), child: pw.Image(logoImage)),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Container(
                        child: pw.Text(
                          "SNA SISTECH Pvt. Ltd",
                          style: pw.TextStyle(color: PdfColors.red),
                        ),
                      ),
                      pw.Container(
                        child: pw.Text(
                          "SNA SISTECH\nShop No.5 , Vallabhnagar Avadhpuri,\nKhajurikalan, Bhopal, Madhya Pradesh\n462022\nIndia",
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 30, width: 30),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.SizedBox(height: 30),
                      pw.Container(child: pw.Text("GSTIN")),
                      pw.Container(child: pw.Text("State")),
                      pw.Container(child: pw.Text("Pan")),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.SizedBox(height: 30),
                      pw.Container(child: pw.Text("  0727232387A8")),
                      pw.Container(child: pw.Text("07-Delhi")),
                      pw.Container(child: pw.Text("AAGCB9745G")),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: <pw.Widget>[
                      pw.SizedBox(height: 30),
                      pw.Container(child: pw.Text("Invoice Date")),
                      pw.Container(child: pw.Text("Invoice No.")),
                      pw.Container(child: pw.Text("Refrence No.")),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: <pw.Widget>[
                      pw.SizedBox(height: 30),
                      pw.Container(child: pw.Text("12/07/2019")),
                      pw.Container(child: pw.Text("BNMK/2020/18")),
                      pw.Container(child: pw.Text("")),
                    ],
                  ),
                ],
              ),
              // Create a line
              pw.Container(
                height: 1.0,
                width: 600.0,
                color: PdfColors.red,
                margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: <pw.Widget>[
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Container(child: pw.Text("Customer Name")),
                      pw.Container(child: pw.Text(name)),
                      pw.SizedBox(width: 20, height: 20),
                      pw.Container(child: pw.Text("Customer GSTIN")),
                      pw.Container(child: pw.Text("2JNSDU3223NI")),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Container(child: pw.Text("Billing Address")),
                      pw.Container(
                        child: pw.FittedBox(
                          fit: pw.BoxFit.fitWidth,
                          child: pw.Text("$name \n$address \nIndia"),
                        ),
                      ),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Container(child: pw.Text("Shipping Address")),
                      pw.Container(
                        child: pw.Text(
                          "SNA SISTECH\n Shop No.5 , Vallabhnagar Avadhpuri,\nKhajurikalan, Bhopal, Madhya Pradesh\n462022\nIndia",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              pw.Container(
                height: 1.0,
                width: 600.0,
                color: PdfColors.red,
                margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              pw.Container(
                alignment: pw.Alignment.centerLeft,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Total items: $quantity "),
              ),
              pw.Container(
                height: 1.0,
                width: 600.0,
                color: PdfColors.red,
                margin: const pw.EdgeInsets.fromLTRB(0, 5, 0, 5),
              ),
              pw.Container(
                color: PdfColors.yellow200,
                padding: pw.EdgeInsets.all(20),
                child: pw.Table(
                  border: pw.TableBorder(
                   horizontalInside: pw.BorderSide(color: PdfColors.black),
                    top: pw.BorderSide(color: PdfColors.black),
                    bottom: pw.BorderSide(color: PdfColors.black),
                    verticalInside: pw.BorderSide.none,
                    left: pw.BorderSide.none,
                    right: pw.BorderSide.none,
                  ),
                  columnWidths: {
                    0: pw.FixedColumnWidth(100),
                    1: pw.FixedColumnWidth(100),
                    2: pw.FixedColumnWidth(50),
                    3: pw.FixedColumnWidth(100),
                    4: pw.FixedColumnWidth(100),
                    5: pw.FixedColumnWidth(50),
                    6: pw.FixedColumnWidth(100),
                  },
                  children: <pw.TableRow>[
                    pw.TableRow(
                      children: <pw.Widget>[
                        pw.Container(child: pw.Text("Product")),
                        pw.Container(child: pw.Text('Title')),
                        pw.Container(child: pw.Text("Qty")),
                        pw.Container(child: pw.Text("Gross\n Amount")),
                        pw.Container(child: pw.Text("Taxable\n Value")),
                        pw.Container(child: pw.Text("IGST")),
                        pw.Container(child: pw.Text("Total")),
                      ],
                    ),
                    pw.TableRow(
                      children: <pw.Widget>[
                        pw.Container(child: pw.Text("Sna Rakshak")),
                        pw.Container(child: pw.Text("Sna Rakshak")),
                        pw.Container(child: pw.Text("$quantity")),
                        pw.Container(child: pw.Text("4000.00")),
                        pw.Container(child: pw.Text("3280.00")),
                        pw.Container(child: pw.Text("720.00")),
                        pw.Container(child: pw.Text("4000.00")),
                      ],
                    ),
                    pw.TableRow(
                      children: <pw.Widget>[
                        pw.SizedBox(),
                        pw.Container(child: pw.Text("Total")),
                        pw.Container(child: pw.Text("1")),
                        pw.Container(child: pw.Text("4000.00")),
                        pw.Container(child: pw.Text("3280.00")),
                        pw.Container(child: pw.Text("720.00")),
                        pw.Container(child: pw.Text("4000.00")),
                      ],
                    ),
                  ],
                ),
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: <pw.Widget>[
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: <pw.Widget>[
                      pw.Container(child: pw.Text("Grand Total")),
                      pw.SizedBox(width: 15),
                      pw.Container(child: pw.Text("4000")),
                    ],
                  ),
                  pw.SizedBox(height: 15),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: <pw.Widget>[
                      pw.Container(child: pw.Text("SNA SISTEC Pvt Ltd")),
                      pw.Container(child: pw.PdfLogo()),
                      pw.Container(child: pw.Text("Authorized Signatory")),
                    ],
                  ),
                ],
              ),
              pw.Container(
                height: 1.0,
                width: 600.0,
                color: PdfColors.black,
                margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              pw.Text("Terms and Condition Applied*"),
            ],
          );
        },
      ),
    );

    final output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());

    return file;
  }
}

