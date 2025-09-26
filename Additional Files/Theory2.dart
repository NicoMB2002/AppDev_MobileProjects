import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //This removes the 'Debug' message
      home: MyFirstWeek(),
    );
  }
}

class MyFirstWeek extends StatelessWidget {
  int counter = 0;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('First Week'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 70,),
              Text('Welcome', style: TextStyle(fontSize: 30),),
              SizedBox(height: 20,),
              Text('To', style: TextStyle(fontSize: 30),),
              SizedBox(height: 20,),
              Text('Vanier', style: TextStyle(fontSize: 30),),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar( //will put a message bottom of the screen
                      SnackBar(content: Text('Authenticated'))
                    );
                  }, 
                  child: Text('Login')),
              SizedBox(height: 10,),
              Row(
                children: [
                  ElevatedButton(onPressed: () {
                    ++counter; //does not work because class is not stateful. It's stateless
                  },
                      child: Text('+', style: TextStyle(fontSize: 15),)),
                  SizedBox(width: 10,),
                  Text('0'),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: () {
                    --counter;
                  },
                      child: Text('-', style: TextStyle(fontSize: 15),))
                ],
              )
            ],
          ),
        ),
      );
    }
  }
