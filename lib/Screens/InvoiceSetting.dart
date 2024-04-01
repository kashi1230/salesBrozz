import 'package:flutter/material.dart';

class InvoiceSettingsScreen extends StatelessWidget {
  const InvoiceSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Series No: MYDKN/02/20-21',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'MYDKN/02/20-21 is your latest invoice number as per your invoice records',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Business Phone Number',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your terms and conditions. This will be visible on all invoices you generate',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Challan Serial No: MYDKN001',
                hintText: 'Enter Challan Serial No',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Business Email',
                hintText: 'Enter Business Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Bank Details',
                hintText: 'Enter Bank Details',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Account Holder Name',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'IFSC Code',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'UPI Id',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Choose your Invoice Template',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the invoice template settings screen
                  },
                  child: Text('Settings'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Bank Name',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Account No',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Branch Name',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(
                  child: Text('English'),
                  value: 'en',
                ),
                DropdownMenuItem(
                  child: Text('Hindi'),
                  value: 'hi',
                ),
              ],
              onChanged: (value) {
                // Handle language change
              },
              hint: Text('Change Language'),
            ),
            SizedBox(height: 10,),
            MaterialButton(onPressed: (){},child: Text("Save"),)
          ],
        ),
      ),
    );
  }
}