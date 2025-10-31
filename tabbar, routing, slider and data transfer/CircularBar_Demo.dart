import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Loader(),
  ));
}

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.redAccent,
              valueColor: AlwaysStoppedAnimation(Colors.green),
              strokeWidth: 10,
            ),
            SizedBox(height: 15,),
            LinearProgressIndicator(
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation(Colors.redAccent),
              minHeight: 20,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
      ),
    );
  }
}
