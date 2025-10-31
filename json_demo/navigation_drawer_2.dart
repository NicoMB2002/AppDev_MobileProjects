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
      body: Center(
        child: Text('Open to Navigate', style: TextStyle(fontSize: 20.0),),
      ),
      drawer: Builder(
        builder: (context) => Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text('Nico'),
                  accountEmail: Text('nico@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                  child: Text('S', style: TextStyle(fontSize: 40),),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.of(context).pop(); //close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage())
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

