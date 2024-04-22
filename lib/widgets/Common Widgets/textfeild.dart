
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../text/textbuilder.dart';


Widget textfield ({label,controller}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
    ),
  );
}
//text
Widget text(){
  return   TextBuilder(text: "Add",fontSize: 16,fontWeight: FontWeight.bold,);
}

Widget ArrowText({text}){
  return   TextBuilder(text: "${text}↓",fontSize: 16,fontWeight: FontWeight.bold,);
}
//coo


//search bar
Widget searchbar(){
  return TextField(
    decoration: InputDecoration(
      hintText: 'Search...',
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.white,
    ),
  );
}
