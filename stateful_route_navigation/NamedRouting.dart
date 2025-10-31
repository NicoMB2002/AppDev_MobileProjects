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
      //here we will refer all the routes by name
      //starting with the initial page
      initialRoute: '/',
      //use routes and give names to all the routes
      // you use in the app
      routes: {
        '/' : (context) => FirstScreen(),
        '/second' : (context) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second', arguments: "Data coming using named route");
                },
                child: Text('Go')
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //since I'm referring a context for data transfer it should be inside the buildContext
    //here the data passed might be null,
    // so we are obliged to convert all the variables to nullable obj
    final String? data = ModalRoute.of(context)?.settings.arguments as String?; //nullable --> '?'
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('$data')
          ],
        ),
      ),
    );
  }
}


