import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Permissions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PermissionScreen(),
    );
  }
}

class PermissionScreen extends StatelessWidget {
  final List<String> allowedScreens = ['Screen1', 'Screen2']; // List of allowed screens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Screen'),
      ),
      body: ListView.builder(
        itemCount: allowedScreens.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(allowedScreens[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => getScreen(allowedScreens[index])),
              );
            },
          );
        },
      ),
    );
  }

  Widget getScreen(String screenName) {
    switch (screenName) {
      case 'Screen1':
        return Screen1();
      case 'Screen2':
        return Screen2();
      default:
        return Container(); // Handle unknown screens
    }
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Center(
        child: Text('Screen 1'),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Text('Screen 2'),
      ),
    );
  }
}
