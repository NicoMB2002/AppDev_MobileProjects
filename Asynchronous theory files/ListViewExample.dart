import 'package:flutter/material.dart';


void main() => runApp(myApp());
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLVExample(),
    );
  }
}


class MyLVExample extends StatelessWidget {
  const MyLVExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List View Example'),
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            color: Colors.red[600],
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'asset/apple.jpg', width: 80, height: 80,
                  ),
                  Text('Apple')
                ],
              )
            ),
            //INCOMPLETE
          ),
          Container(
            height: 50,
            color: Colors.blue[600],
            child: Center(child: Text('Blue berry'),),
          ),
          Container(
            height: 50,
            color: Colors.green[600],
            child: Center(child: Text('Pear'),),
          ),
          Container(
            height: 50,
            color: Colors.orange[600],
            child: Center(child: Text('Mango'),),
          ),
        ],
      ),
    );
  }
}
