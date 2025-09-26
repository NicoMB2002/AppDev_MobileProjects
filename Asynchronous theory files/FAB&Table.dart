import 'package:flutter/material.dart';

void main() {
  runApp(MyFAB());
}

class MyFAB extends StatelessWidget {
  const MyFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFabBtn(),
    );
  }
}

class MyFabBtn extends StatefulWidget {
  const MyFabBtn({super.key});

  @override
  State<MyFabBtn> createState() => _MyFabBtnState();
}

class _MyFabBtnState extends State<MyFabBtn> {

  String _value = '';
  //_onClicked() will display the current time
  void _onClicked() => setState(() => _value = new DateTime.now().toString());  //setState reflects
                                                                        // the change for the stateful
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAB'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        backgroundColor: Colors.red,
        //if you set mini to true then it will make your FAB small
        mini: false,
        child: Icon(Icons.timer),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text(_value),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: null, //will disable the button
                  child: Text('Login')
              ),
              DataTable(
                  columns: [
                    DataColumn(label: Text('Roll Number')),
                    DataColumn(label: Text('Student Number')),
                    DataColumn(label: Text('Phone Number')),
                  ],
                  rows: [
                    DataRow(
                        cells: [
                          DataCell(Text('121')),
                          DataCell(Text('5326345')),
                          DataCell(Text('438 6585 5849')),
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('122')),
                          DataCell(Text('4236543')),
                          DataCell(Text('514 4273 7455')),
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('123')),
                          DataCell(Text('7672656')),
                          DataCell(Text('438 8794 9654')),
                        ]
                    ),
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}

