import 'package:flutter/material.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/Button.dart';

Widget AddDialogeBoxAll({namecontrller,contactcontrolller,typecontroller,citycontroller,saveontap,cancelontap,name,contact,city ,state,type}){
  return AlertDialog(
    backgroundColor: Colors.white,
    title: Text('Add Customer'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: namecontrller,
          decoration:
          InputDecoration(labelText: name),
        ),
        TextField(
          controller: contactcontrolller,
          decoration: InputDecoration(
              labelText: contact),
        ),
        TextField(
          controller: typecontroller,
          decoration:
          InputDecoration(labelText: type),
        ),
        TextField(
          controller: citycontroller,
          decoration:
          InputDecoration(labelText: city),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
          children: [
            FButton(title: "Save",onpress: saveontap),
            CancelButton(title: "Cancel",ontap: cancelontap)
          ],
        ),
      ],
    ),
  );
}


