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
      theme: ThemeData(primaryColor: Colors.green),
      home: MyPage(),
    );
  }
}

//It is obvious to choose the stateful as
//it is good practice to listen the user action
// to shift the tab bar by tapping
class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.android), text: 'Google',),
              Tab(icon: Icon(Icons.phone_iphone), text: 'Apple',),
            ]
            ),
            title: Text('Tab Bar Demo'),
          ),
          body: TabBarView(children: [
            Center(child: Text('Android Pixel'),),
            Center(child: Text('Iphone 17 Pro Max'),),
          ]),
        )
    );
  }
}

