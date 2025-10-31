import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyNavigation(),
  ));
}

class MyNavigation extends StatefulWidget {
  const MyNavigation({super.key});

  @override
  State<MyNavigation> createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  
  int _selectedIndex = 0; //by default, I am supposed to display the initial page
  //which is index 0
  
  List<Widget> _widgetOptions = [
    Text('Home Page', style: 
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
    Text('Home Page', style:
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
    Text('Home Page', style:
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
  ];
  
  void _onTimeTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // It should be outside the body because it remains static for all the index
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
              backgroundColor: Colors.redAccent,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.greenAccent,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person),
              label: 'User',
              backgroundColor: Colors.blueAccent,
            ),
          ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onTimeTapped,
        elevation: 5,
      ),
    );
  }
}
