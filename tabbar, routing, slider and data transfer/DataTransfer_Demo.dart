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
      home: Form(),
    );
  }
}

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {

  //Create 3 Text Editing Controller

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name'
              ),
            ),),
            Padding(padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Email'
                ),
              ),),
            Padding(padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your phone'
                ),
              ),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SecondScreen(
                  name: _name.text,
                  email: _email.text,
                  phone: _phone.text)));
              // Navigator.of(context).push(route)
            }, child: Text('Go New page'))
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String name, email, phone;
  const SecondScreen({required this.name, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Name:  $name'),
            Text('Email:  $email'),
            Text('Phone:  $phone'),
          ],
        ),
      ),
    );
  }
}




