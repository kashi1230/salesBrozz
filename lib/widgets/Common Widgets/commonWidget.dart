
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget HButton ({String ?text  ,ontap ,icon}){
  return
      TextButton(
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
          ),
          child:  Text(
            text!,
            style: TextStyle(color: Colors.white, fontSize: 13.0),
          ),
        ),
      );
}

Widget IButton(icon ,ontap){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40.0),
      color: Colors.red, // Background color
    ),
    child: IconButton(
      icon: Icon(icon),
      color: Colors.white, // Icon color
      onPressed: ontap,
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