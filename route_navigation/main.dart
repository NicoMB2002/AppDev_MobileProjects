import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFirstScreen(),
    );
  }
}

class MyFirstScreen extends StatelessWidget {
  //const MyFirstScreen({super.key});
  final List<String> items = ['Apple', 'Kiwi', 'Cherry', 'Pear', 'Berry'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Welcome to First'),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {
                  // call the Navigator class for connecting
                  //first and second screen
                  // Use MaterialPageRoute for transition
                  // and also to replace old with new route
                  //We now take some data and move to second route
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (context) =>
                            // SecondScreen(
                            // data: 'Simple data from route1',
                            // newData: 'This is new'
                      SecondScreen(items: items)
                    )
                  );
                }, 
                child: Text('Go Second')
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  // final String data;
  // final String newData;
  // const SecondScreen({super.key});

  final List<String> items;
  SecondScreen({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
          itemBuilder: (context, index) {
          return ListTile(
            trailing: Icon(Icons.check_circle_outline),
            title: Text(items[index]),
          );
          }
      ),
    );
  }
}
