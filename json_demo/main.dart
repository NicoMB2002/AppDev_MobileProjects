import 'dart:convert'; // this is used to converting
// json object to dart object

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// access local Json data from the assets

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyJson(),
    );
  }
}

class MyJson extends StatefulWidget {
  const MyJson({super.key});

  @override
  State<MyJson> createState() => _MyJsonState();
}

class _MyJsonState extends State<MyJson> {
  List _items = [];

  // function to fetch the content from the local json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('asset/sample.json');
    final data = await jsonDecode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: readJson, child: Text("Load Data")),
          // display the data that is loaded from sample.json
          _items.isNotEmpty
              ? Expanded(
            child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Text(_items[index]["id"]),
                      title: Text(_items[index]["name"]),
                      tileColor: Colors.amber,
                      subtitle: Text(_items[index]["description"]),
                    ),
                  );
                }),
          )
              : Container()
        ],
      ),
    );
  }
}