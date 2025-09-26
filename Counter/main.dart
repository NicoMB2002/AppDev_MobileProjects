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
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget { //means the class will be modified
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 70,),
            Text('A simple', style: TextStyle(fontSize: 30),),
            SizedBox(height: 20,),
            Text('Counter', style: TextStyle(fontSize: 30),),
            SizedBox(height: 20,),
            Text('Program', style: TextStyle(fontSize: 30),),
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
                  setState(() { //setState is used only in stateful widget.
                                //setState will reflect the changes that are made in the class.
                    ++counter;
                  });
                },
                    child: Text('+', style: TextStyle(fontSize: 15),)),
                SizedBox(width: 10,),
                Text('$counter'),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: () {
                  setState(() {
                    if(counter <= 0) {
                      counter = 1;
                    }
                    --counter;
                  });
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


