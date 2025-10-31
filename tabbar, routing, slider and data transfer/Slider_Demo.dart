import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MySlider(),
  ));
}

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {

  int _value = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(15),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.volume_up,
              size: 40,
            ),
            Expanded(
                child: Slider(
                  value: _value.toDouble(),
                  max: 20.0, min: 1.0,
                  divisions: 10, activeColor: Colors.green,
                  inactiveColor: Colors.redAccent,
                  label: 'Set Volume Control',
                  onChanged: (double newValue) {
                    setState(() {
                      _value = newValue.round();
                    });
                  },
              )
            )
          ],
        ),
      ),),
    );
  }
}
