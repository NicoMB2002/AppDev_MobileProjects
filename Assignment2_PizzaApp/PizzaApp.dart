import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/register': (context) => RegisterInterface(),
        '/pizzas': (context) => PizzaListings(),
        '/order': (context) => OrderConfirmation()
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  Database? database;
  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, 'Pizzeria.db');
    database = await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, password TEXT)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE users ADD COLUMN text TEXT');
        }
      },
    );
    await refreshUsers();
  }

  Future<void> refreshUsers() async {
    if (database == null) return;
    final List<Map<String, dynamic>> maps = await database!.query('users');
    setState(() {
      userList = List.generate(maps.length, (i) {
        return User(
          id: maps[i]['id'],
          name: maps[i]['name'],
          age: maps[i]['age'],
          password: maps[i]['password'],
        );
      });
    });
  }

  void login() {
    final enteredId = int.tryParse(_idController.text.trim());
    final enteredPassword = _passwordController.text.trim();

    if (enteredId == null || enteredPassword.isEmpty) {
      showDialog(
        context: this.context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('Please enter both ID and password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(this.context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final matchedUser = userList.firstWhere(
      (user) => user.id == enteredId && user.password == enteredPassword,
      orElse: () => User(id: -1, name: '', age: 0, password: ''),
    );

    if (matchedUser.id != -1) {
      Navigator.pushNamed(
        this.context,
        '/pizzas',
        arguments: "Welcome, ${matchedUser.name}!",
      );
    } else {
      showDialog(
        context: this.context,
        builder: (_) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid ID or password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(this.context),
              child: Text('Try Again'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Application'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Login', style: TextStyle(fontSize: 25)),
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            Column(
              children: [
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/register',
                      arguments: "${_idController}",
                    );
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterInterface extends StatefulWidget {
  const RegisterInterface({super.key});

  @override
  State<RegisterInterface> createState() => _RegisterInterfaceState();
}

class _RegisterInterfaceState extends State<RegisterInterface> {
  // create a database instance
  Database? database;
  List<User> userList = []; // create a container to store the User instance

  // create the controller
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  // this function will launch once we start the app
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDatabase();
  }

  // define the function
  Future<void> initializeDatabase() async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, 'Pizzeria.db');
    database = await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, password TEXT)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE users ADD COLUMN text TEXT');
        }
      },
    );
    await refreshUsers();
  }

  // define the function
  Future<void> refreshUsers() async {
    if (database == null) return;
    final List<Map<String, dynamic>> maps = await database!.query('users');
    setState(() {
      userList = List.generate(maps.length, (i) {
        return User(
          id: maps[i]['id'],
          name: maps[i]['name'],
          age: maps[i]['age'],
          password: maps[i]['password'],
        );
      });
    });
  }

  // create insert function
  Future<void> insertUser(User user) async {
    final data = {
      'name': user.name,
      'age': user.age,
      'password': user.password,
    };

    try {
      await database!.insert(
        'users',
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      await refreshUsers();
    } catch (e) {
      print('Insert failed: $e');
    }
  }

  // create a function to clear the forms
  void clearForm() {
    _idController.clear();
    _nameController.clear();
    _ageController.clear();
    _passwordController.clear();
    _confirmController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final String? data = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Application'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Register', style: TextStyle(fontSize: 25)),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _confirmController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final name = _nameController.text.trim();
                    final age = int.tryParse(_ageController.text) ?? 0;
                    final password = _passwordController.text.trim();
                    final confirm = _confirmController.text.trim();

                    if (name.isEmpty ||
                        age <= 0 ||
                        password.isEmpty ||
                        confirm.isEmpty) {
                      showDialog(
                        context: this.context,
                        builder: (_) => AlertDialog(
                          title: Text('Missing Info'),
                          content: Text('Please fill out all fields.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(this.context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                      return;
                    } else if (password != confirm) {
                      showDialog(
                        context: this.context,
                        builder: (_) => AlertDialog(
                          title: Text('Password Mismatch'),
                          content: Text('Passwords do not match.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(this.context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                      return;
                    } else {
                      await insertUser(
                        User(
                          id: null,
                          name: name,
                          age: age,
                          password: password,
                        ),
                      );
                      clearForm();
                      showDialog(
                        context: this.context,
                        builder: (_) => AlertDialog(
                          title: Text('Success'),
                          content: Text('Registration complete!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(this.context);
                                Navigator.pushNamed(this.context, '/');
                              },
                              child: Text('Go to Login'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Save Info'),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Display the dog instances
            Expanded(
              child: userList.isEmpty
                  ? Center(child: Text('No Data Found'))
                  : ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        final user = userList[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(child: Text('${user.id}')),
                            title: Text(user.name),
                            subtitle: Text('Age : ${user.age}'),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class PizzaListings extends StatelessWidget {
  const PizzaListings({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> pizzaImages = [
      'asset/pizza1.jpg',
      'asset/pizza2.jpg',
      'asset/pizza3.jpg',
      'asset/pizza4.jpg',
      'asset/pizza5.jpg',
      'asset/pizza6.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pizzas'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(pizzaImages.length, (index) {
            final imagePath = pizzaImages[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PizzaDetailsPage(imagePath: imagePath),
                  ),
                );
              },
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            );
          }),
        )
      ),
    );
  }
}

class PizzaDetailsPage extends StatefulWidget {
  final String imagePath;

  const PizzaDetailsPage({super.key, required this.imagePath});

  @override
  State<PizzaDetailsPage> createState() => _PizzaDetailsPageState();
}

class _PizzaDetailsPageState extends State<PizzaDetailsPage> {
  double smallPrice = 10;
  double mediumPrice = 20;
  double largePrice = 30;

  double sToppingPrice = 2;
  double mToppingPrice = 3;
  double lToppingPrice = 5;

  int smallCounter = 0;
  int mediumCounter = 0;
  int largeCounter = 0;

  int sToppingCounter = 0;
  int mToppingCounter = 0;
  int lToppingCounter = 0;

  double pizzaPrice = 0;
  double finalPrice = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Pizza Details')),
      body: Center(
        child: Column(
          children: [
            Image.asset(widget.imagePath, fit: BoxFit.cover),
            SizedBox(height: 20,),
            Text('This is the description of this pizza'),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Size', style: TextStyle(fontWeight: FontWeight.bold),),
                Text('Small'),
                Text('Medium'),
                Text('Large'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Price', style: TextStyle(fontWeight: FontWeight.bold),),
                Text('\$$smallPrice CAD'),
                Text('\$$mediumPrice CAD'),
                Text('\$$largePrice CAD'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 15,),
                Text('Qty', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (smallCounter > 0) {
                            --smallCounter;
                            finalPrice -= smallPrice;
                          }
                        });
                      },
                    ),
                    Text('$smallCounter'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          ++smallCounter;
                          finalPrice += smallPrice;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (mediumCounter > 0) {
                            --mediumCounter;
                            finalPrice -= mediumPrice;
                          }
                        });
                      },
                    ),
                    Text('$mediumCounter'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          ++mediumCounter;
                          finalPrice += mediumPrice;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (largeCounter > 0) {
                            --largeCounter;
                            finalPrice -= largePrice;

                          }
                        });
                      },
                    ),
                    Text('$largeCounter'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          ++largeCounter;
                          finalPrice += largePrice;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Toppings', style: TextStyle(fontWeight: FontWeight.bold),),
                Text('S \$$sToppingPrice CAD'),
                Text('M \$$mToppingPrice CAD'),
                Text('L \$$lToppingPrice CAD'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 15,),
                Text('Qty', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (sToppingCounter > 0) {
                            --sToppingCounter;
                            finalPrice -= sToppingPrice;
                          }
                        });
                      },
                    ),
                    Text('$sToppingCounter'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          ++sToppingCounter;
                          finalPrice += sToppingPrice;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (mToppingCounter > 0) {
                            --mToppingCounter;
                            finalPrice -= mToppingPrice;
                          }
                        });
                      },
                    ),
                    Text('$mToppingCounter'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          ++mToppingCounter;
                          finalPrice += mToppingPrice;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (lToppingCounter > 0) {
                            --lToppingCounter;
                            finalPrice -= lToppingPrice;
                          }
                        });
                      },
                    ),
                    Text('$lToppingCounter'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          ++lToppingCounter;
                          finalPrice += lToppingPrice;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text('Total cost', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('$finalPrice')
            ],
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(
                context,
                '/order',
                arguments: "$finalPrice",
              );
            }, child: Text('Order'))
          ],
        ),
      ),
    );;
  }
}

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {

  @override
  Widget build(BuildContext context) {
    final String? message = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('Your Order has been processed.', style: TextStyle(fontSize: 30),),
            SizedBox(height: 40,),
            Text('Please pay \$$message', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/',
                );
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}


class User {
  final int? id;
  final String name;
  final int age;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.password,
  });

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'age': age, 'password': password};
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, age: $age, password : $password}';
  }
}
