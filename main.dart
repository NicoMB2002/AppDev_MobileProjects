import 'package:flutter/material.dart';

void main() {
  runApp(LakeProject2());
}

class LakeProject2 extends StatelessWidget {
  const LakeProject2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // hide debug
      home: MyLakeProject(),
    );
  }
}

class MyLakeProject extends StatelessWidget {
  const MyLakeProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lake view'),
      ),
      body: ListView(
        // if the Widget takes more space than needed, then
        // the interface or the screen becomes scrollable
        children: [
          Image.asset(
            'asset/Lake4.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(32), // it gives 32 pixel in all sides
            child: Row(
              children: [
                Expanded(
                  // it makes the widget to fill the space efficiently
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Oeschinen Lake CampGround',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Kandersteg, Switzerland',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Icon(Icons.star, color: Colors.red,),
                Text('41')
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.near_me, color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'ROUTE',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.share, color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'SHARE',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.call, color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'CALL',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              'Large prehistoric landslides in the '
                  'upper Kander valley created the natural'
                  ' dam between Kandersteg and Kandergrund,'
                  ' which impounded Oeschinen Lake.[3]'
                  ' Geological research attributes the deposits'
                  ' either to a rock avalanche from the northern'
                  ' flank of the Doldenhorn, or to an older rock'
                  ' avalanche from the Fisistock.[1]'
                  'In the 17th and 18th centuries, sulfur was mined '
                  'on the Oeschinenalp.[3] With the rise of Alpinism after 1850,',
              softWrap: true,
              textAlign: TextAlign.justify,

            ),
          )
        ],
      ),
    );
  }
}

