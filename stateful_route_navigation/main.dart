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
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // this controller controls the data from the user feed
  TextEditingController _userName = TextEditingController();
  TextEditingController _passWord = TextEditingController();

  // write a function that extracts the value from the controllers
  // and also push the data to the second screen

  void _navigatetosecond() {
    // this line will fetch the data from the textfield and store in the var
    final String usernametext = _userName.text;
    final String passwordText = _passWord.text;

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DashBoard(uname: usernametext, pwd: passwordText)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _userName,
              decoration: InputDecoration(
                  labelText: 'Username'
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _passWord,
              decoration: InputDecoration(
                  labelText: 'Password'
              ),
              obscureText: true,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: _navigatetosecond ,
                child: Text('Go now'))
          ],
        ),
      ),
    );
  }
}

class DashBoard extends StatelessWidget {
  // const DashBoard({super.key});
  final String uname;
  final String pwd;

  DashBoard({required this.uname, required this.pwd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome to second'),
      ),
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          children: [
            Text('your user name is $uname'),
            SizedBox(height: 20,),
            Text('your password is $pwd'),
          ],
        ),
      ),
    );
  }
}