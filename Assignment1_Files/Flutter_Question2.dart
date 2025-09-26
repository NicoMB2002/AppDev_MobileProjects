import 'package:flutter/material.dart';

void main() {
  runApp(const MyApartmentApp());
}

class MyApartmentApp extends StatelessWidget {
  const MyApartmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApartment(),
    );
  }
}

class MyApartment extends StatelessWidget {
  const MyApartment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Apartments', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        color: Colors.black26,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  width: 400,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage('asset/apartment1.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    'Chill Apartment',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),
                                  ),
                                  SizedBox(width: 180,),
                                  Text(
                                    'Montreal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 420,
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 3,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    '\$2,950 per month',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                  SizedBox(width: 170,),
                                  Icon(Icons.star),
                                  Text(
                                    '4.0/5',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  width: 400,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage('asset/apartment2.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    'Downtown Apt',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                  SizedBox(width: 180,),
                                  Text(
                                    'Toronto',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 420,
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 3,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    '\$1,650 per month',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                  SizedBox(width: 170,),
                                  Icon(Icons.star),
                                  Text(
                                    '4.5/5',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  width: 400,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage('asset/apartment3.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    'Mont Royal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                  SizedBox(width: 180,),
                                  Text(
                                    'Montreal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 420,
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 3,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    '\$1,100 per month',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                  SizedBox(width: 170,),
                                  Icon(Icons.star),
                                  Text(
                                    '3.5/5',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  width: 400,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage('asset/apartment4.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    'Renovated Apt',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                  SizedBox(width: 180,),
                                  Text(
                                    'Quebec',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 420,
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 3,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    '\$950 per month',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                  SizedBox(width: 170,),
                                  Icon(Icons.star),
                                  Text(
                                    '3.2/5',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  width: 400,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage('asset/apartment5.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    'Hotel Apt',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                  SizedBox(width: 180,),
                                  Text(
                                    'Vancouver',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 420,
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 3,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    '\$2,100 per month',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                  SizedBox(width: 170,),
                                  Icon(Icons.star),
                                  Text(
                                    '4.3/5',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}


