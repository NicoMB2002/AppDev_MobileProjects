import 'package:flutter/material.dart';

void main() {
  runApp(const MyCartApp());
}

class MyCartApp extends StatefulWidget {
  const MyCartApp({super.key});

  @override
  State<MyCartApp> createState() => _MyCartAppState();
}

class _MyCartAppState extends State<MyCartApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _AddToCart(),
    );
  }
}

class _AddToCart extends StatefulWidget {
  const _AddToCart({super.key});

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  int appleCounter = 0;
  double applePrice = 1.45;
  int pearCounter = 0;
  double pearPrice = 1.25;
  int bBerryCounter = 0;
  double bBerryPrice = 1.00;
  int mangoCounter = 0;
  double mangoPrice = 1.65;
  int itemCounter = 0;
  double GST = 0.05;
  double QST = 0.10;
  double itemPrice = 0;

  @override
  Widget build(BuildContext context) {

    double gstAmount = itemPrice * GST;
    double qstAmount = itemPrice * QST;
    String stringItemPrice = itemPrice.toStringAsFixed(2);
    double salesTax = gstAmount + qstAmount;
    String salesTotal = (salesTax).toStringAsFixed(2);
    String total = (itemPrice + salesTax).toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Divider(color: Colors.grey, thickness: 3, indent: 3, endIndent: 3,),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'asset/apple.jpg',
                        width: 180,
                        height: 180,
                      ),
                      Column(
                        children: [
                          Text(
                            'Apple - XX Traders',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$$applePrice/kg',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.red
                                      )
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      ++appleCounter;
                                      ++itemCounter;
                                      itemPrice += applePrice;
                                    });
                                  },
                                  child: Text('+', style: TextStyle(fontSize: 20, color: Colors.red),)
                              ),
                              SizedBox(width: 10,),
                              Text('$appleCounter'),
                              SizedBox(width: 10,),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.red
                                      )
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if(appleCounter > 0) {
                                        --appleCounter;
                                        --itemCounter;
                                        itemPrice -= applePrice;
                                      }
                                    });
                                  },
                                  child: Text('-', style: TextStyle(fontSize: 20, color: Colors.red),)
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'asset/pear.jpg',
                        width: 180,
                        height: 180,
                      ),
                      Column(
                        children: [
                          Text(
                            'Pear - XYZ Traders',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$$pearPrice/kg',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.red
                                      )
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      ++pearCounter;
                                      ++itemCounter;
                                      itemPrice += pearPrice;
                                    });
                                  },
                                  child: Text('+', style: TextStyle(fontSize: 20, color: Colors.red),)
                              ),
                              SizedBox(width: 10,),
                              Text('$pearCounter'),
                              SizedBox(width: 10,),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.red
                                      )
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if(pearCounter > 0) {
                                        --pearCounter;
                                        --itemCounter;
                                        itemPrice -= pearPrice;
                                      }
                                    });
                                  },
                                  child: Text('-', style: TextStyle(fontSize: 20, color: Colors.red),)
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'asset/blueberry.jpg',
                        width: 180,
                        height: 180,
                      ),
                      Column(
                        children: [
                          Text(
                            'Blue Berry - ARG Traders',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$$bBerryPrice/kg',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.red
                                      )
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      ++bBerryCounter;
                                      ++itemCounter;
                                      itemPrice += bBerryPrice;
                                      
                                    });
                                  },
                                  child: Text('+', style: TextStyle(fontSize: 20, color: Colors.red),)
                              ),
                              SizedBox(width: 10,),
                              Text('$bBerryCounter'),
                              SizedBox(width: 10,),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.red
                                      )
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if(bBerryCounter > 0) {
                                        --bBerryCounter;
                                        --itemCounter;
                                        itemPrice -= bBerryPrice;
                                      }
                                    });
                                  },
                                  child: Text('-', style: TextStyle(fontSize: 20, color: Colors.red),)
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'asset/mango.jpg',
                        width: 180,
                        height: 180,
                      ),
                      Column(
                        children: [
                          Text(
                            'Mango - GAD Traders',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$$mangoPrice/kg',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.red
                                      )
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      ++mangoCounter;
                                      ++itemCounter;
                                      itemPrice += mangoPrice;
                                    });
                                  },
                                  child: Text('+', style: TextStyle(fontSize: 20, color: Colors.red),)
                              ),
                              SizedBox(width: 10,),
                              Text('$mangoCounter'),
                              SizedBox(width: 10,),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1,
                                          color: Colors.red
                                      )
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if(mangoCounter > 0) {
                                        --mangoCounter;
                                        --itemCounter;
                                        itemPrice -= mangoPrice;
                                      }
                                    });
                                  },
                                  child: Text('-', style: TextStyle(fontSize: 20, color: Colors.red),)
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.all(12),
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar( //will put a message bottom of the screen
                                      SnackBar(content: Text('Total:      $total'))
                                  );
                                },
                                child: Text(
                                  'Secure Checkout',
                                )
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Subtotal ($itemCounter Items)',
                              style: TextStyle(
                              color: Colors.white
                            ),),
                            Text(
                                '  GST',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            Text(
                              '+ QST',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            Text(
                              'Sales Taxes',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            Text(
                              'Cart Total After Taxes',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Text('$stringItemPrice'),
                            Text('$GST'),
                            Text('$QST'),
                            Text('$salesTotal'),
                            Text('$total')
                          ],
                        )
                      ],
                    ),
                  )

                ],
              )
            )
          ],
        ),
      ),
    );
  }
}



