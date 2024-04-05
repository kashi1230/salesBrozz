import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesbrozz/main.dart';



class Schemes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List value = Provider.of<ValueProvider>(context).value;
    return Scaffold(
      body: ListView.builder(
        itemCount: value.length,
          itemBuilder: (context ,index){
        return Card(
          color: Colors.white,
          elevation: 4.0,
          margin: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(''),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 100.0, // Adjust as per your requirement
                  width: 100.0, // Adjust as per your requirement
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    value[index],
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      })
    );
  }
}
