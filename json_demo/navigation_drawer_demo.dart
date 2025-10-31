import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NaviDrawDemo(),
    );
  }
}

class NaviDrawDemo extends StatelessWidget {
  const NaviDrawDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A Drawer is an invisible side Screen'),
      ),
      body: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('John Wick'),
                accountEmail: Text('Jwhick@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: Text(
                  'JW', style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.home), title: Text('My home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts), title: Text('My contacts'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}


