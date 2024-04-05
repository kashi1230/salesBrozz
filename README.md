# salesbrozz

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Row(

children: [
Text("Add Customer",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

ElevatedButton(

onPressed: () {},

// icon of the button

child: Icon(Icons.add, color: Colors.white),

// styling the button

style: ElevatedButton.styleFrom(

shape: CircleBorder(),

padding: EdgeInsets.all(8),

// Button color

backgroundColor: Colors.black,

// Splash color

foregroundColor: Colors.cyan,

),

),

],

),
