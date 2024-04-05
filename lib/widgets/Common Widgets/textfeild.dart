
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget textfield ({label,controller}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
    ),
  );
}

