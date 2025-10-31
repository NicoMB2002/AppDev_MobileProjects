import 'package:flutter/material.dart';
import 'dart:math';

void main() {

  runApp(const MyDiceApp());

}

class MyDiceApp extends StatelessWidget {
  const MyDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice app',
      home: Dices(),
    );
  }
}

class Dices extends StatefulWidget {

  const Dices({super.key});

  @override
  State<Dices> createState() => _DicesState();
}

class _DicesState extends State<Dices> {
  int dice1= 1;
  int dice2= 2;
  int dice3= 3;
  int dice4= 4;
  int dice5= 5;
  int dice6= 6;

  String? image;
  String initialValue = 'asset/dice1.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Dice Generator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Image.asset(initialValue, scale: 3,),
                Image.asset(initialValue, scale: 3,),
              ],
            ),

            Row(
              children: [
                ElevatedButton(onPressed: () {
                  Random rand = new Random();
                  int randNum = rand.nextInt(6) + 1;

                  if(randNum == 1) {
                    setState(() {

                    });
                  }
                }, child: Text('Randomize'))
              ],
            )


          ],
        ),
      ),
    );
  }
}



