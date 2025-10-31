import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp( //can run direct;y from runApp BUT not recommended
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      //Crate two routes and refer it by the context names
      '/': (context) => RouteOne(),
      '/detail': (context) => RouteTwo(item: '')
    }
  ));
}

class RouteOne extends StatelessWidget {
  final list = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: list.length,
            itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RouteTwo(
                      item: list[index]
                    ))
                );
              },
            );
            }
        ),
      ),
    );
  }
}

class RouteTwo extends StatelessWidget {

  final String item;
  RouteTwo({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Text('You clicked on this item: $item',
            style: TextStyle(fontSize: 32),),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
            },
                child: Text('Back'))
          ],
        ),
      ),
    );
  }
}

