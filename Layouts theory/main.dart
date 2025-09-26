import 'package:flutter/material.dart';

void main() {
  runApp(ContainerProject());
}

class ContainerProject extends StatelessWidget {
  const ContainerProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageContainer(),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildImageColumn(), //To see with padding
        // child: _buildGrid(), //To see as grid
        //   child: _buildList(), //To see ListView
      ),
    );
  }

  _buildImageColumn() {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          _buildImageRow(1),
          _buildImageRow(3),
        ],
      ),
    );
  }

  // write a function to create a griw view

  _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTile(6));

// call a list to display all the pics inside the grid

  List<Widget> _buildGridTile(int count) =>
      List.generate(count, (i) => Image.asset('asset/pic$i.jpg'));

// in the developer tutorials, you will be given arrow function instead of
  // curly braces, we should embrace this adaptation
  _buildDecoratedRow(int i) => Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 10, color: Colors.green),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        margin: EdgeInsets.all(4),
        child: Image.asset('asset/pic$i.jpg'),
      ));

  _buildImageRow(int i) => Row(
    children: [
      _buildDecoratedRow(i),
      _buildDecoratedRow(i + 1),
    ],
  );

  // building a listview ( collection of list tiles) and also a list Tile
  _buildList() {
    return ListView(
      children: [
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        Divider(),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "TV Shows ",
          ' Montreal',
          Icons.tv,
        ),
        _tile(
          "TV Shows ",
          ' Montreal',
          Icons.tv,
        ),
        _tile(
          "TV Shows ",
          ' Montreal',
          Icons.tv,
        ),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        Divider(),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "TV Shows ",
          ' Montreal',
          Icons.tv,
        ),
        _tile(
          "TV Shows ",
          ' Montreal',
          Icons.tv,
        ),
        _tile(
          "TV Shows ",
          ' Montreal',
          Icons.tv,
        ),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        Divider(),
        _tile(
          "Movies ",
          ' address 1',
          Icons.theaters,
        ),
        _tile(
          "TV Shows ",
          ' Montreal',
          Icons.tv,
        ),
        _tile(
          "TV Shows ",
          ' Montreal',
          Icons.tv,
        ),
        _tile(
          "TV Shows ",
          ' Montreal',
          Icons.tv,
        ),
      ],
    );
  }

  _tile(String s, String t, IconData theaters) {
    return ListTile(
      title: Text(
        s,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 26,
        ),
      ),
      subtitle: Text(t),
      leading: Icon(
        theaters,
        color: Colors.green,
      ),
    );
  }
}