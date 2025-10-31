import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyDropDown(),
  ));
}

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  //Initial Selected Value
  String dropDownValue = 'USA';

  //List of items in the dropdown menu
  var items = [
    'USA', 'China', 'France', 'Poland', 'Canada'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              //Initial value
              value: dropDownValue,
                //Drop Arrow Icon
                icon: Icon(Icons.keyboard_arrow_down),
                //List of Items
                // I use map to transform the list objects
                //to dropdown menu object and it is mandatory
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                      child: Text(items)
                  );
                }).toList(), // you must convert the object to list to display
                onChanged: (String? newValue) {
                setState(() {
                  dropDownValue = newValue!; // it asserts that the value of that expression is not null
                  //'!' you are confident a nullable variable will not be null at that specific
                  // point in the code (used when variable is declared with '?).
                });
                }
            ),
          ],
        ),
      ),
    );
  }
}
