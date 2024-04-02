import 'package:flutter/material.dart';

class InvoiceSettingsScreen extends StatefulWidget {
   InvoiceSettingsScreen({super.key});

  @override
  State<InvoiceSettingsScreen> createState() => _InvoiceSettingsScreenState();
}

class _InvoiceSettingsScreenState extends State<InvoiceSettingsScreen> {
  bool valuefirst = false;
  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("| Invoice Setting |" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            textfield(label: "Series No."),
            SizedBox(height: 16.0),
            textfield(label: "Challan Serial No: MYDKN001"),
            SizedBox(height: 16.0),
            textfield(label: "Business Phone Number"),
            SizedBox(height: 16.0),
            textfield(label: "Business Email"),
            SizedBox(height: 20.0),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Your terms and conditions. This will be visible on all invoices you generate',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your feedback';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.greenAccent,
                  activeColor: Colors.red,
                  value: this.valuefirst,
                  onChanged: (bool? value) {},
                ),
                Text('Send sms Invoice copy to customer',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold), ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.greenAccent,
                  activeColor: Colors.red,
                  value: this.valuefirst,
                  onChanged: (bool? value) {},
                ),
                Text('Send sms Invoice copy to Self',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold), ),
              ],
            ),
            SizedBox(height: 15,),
            Text("| Bank Details |" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: textfield(label: "Account Holder name")
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: textfield(label: "IFSC Code")
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                    child: textfield(label: "Account Number")
                ),
                SizedBox(width: 16.0),
                Expanded(
                    child: textfield(label: "Bank Name")
                ),
              ],
            ),
            textfield(label: "UPI Id"),
            SizedBox(height: 20.0),
            Text("Choose your Invoice Template",style: TextStyle( fontSize: 18.0,fontWeight: FontWeight.bold)),
            button(text: "Click here",color: Colors.red,ontap: (){
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                        itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(""),
                        ),
                      );
                    })
                  );
                },
              );
            }),
            SizedBox(height: 10.0),
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
              hint: Text('Change Language',style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(text: "Save",color: Colors.blue),
              ],
            )
          ],
        ),
      ),
    );
  }
}
Widget button ({ontap, String ?text,color}){
  return TextButton(
    onPressed: ontap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
      ),
      child:Text(text!, style: TextStyle(color: Colors.white, fontSize: 14.0),),
    ),
  );
}


Widget textfield ({label,controller}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
    ),
  );
}