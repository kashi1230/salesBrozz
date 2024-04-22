import 'package:flutter/material.dart';


class Leadger extends StatelessWidget {
  const Leadger({super.key});

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("1"),value: "1"),
      DropdownMenuItem(child: Text("2"),value: "2"),
      DropdownMenuItem(child: Text("3"),value: "3"),
      DropdownMenuItem(child: Text("4"),value: "4"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    String selectedValue = "";
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Transaction",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      SizedBox(width: 130,),

                      CustomButton(text: "Add ", onPressed: (){}),
                      SizedBox(width: 10,),

                      Text("Filter")
                    ],
                  ),
                  SizedBox(height: 10,),
                  // CustomButton(
                  //   text: 'ADD',
                  //   onPressed: () {
                  //     // Add your button press logic here
                  //   },
                  // ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                children: [
                  Text("Add Your  First Client",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  CustomButton(
                    text: 'ADD CLIENT',
                    onPressed: () {
                      // Add your button press logic here
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Add Your Transaction",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  CustomButton(
                    text: 'ADD Transaction',
                    onPressed: () {
                      // Add your button press logic here
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}