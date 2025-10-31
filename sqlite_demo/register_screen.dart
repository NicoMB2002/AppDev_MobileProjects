import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        '/register' : (context) => RegisterInterface(),
        '/pizzas' : (context) => PizzaListings()
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
              'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, password TEXT)'
          );
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
        builder: (_) =>
            AlertDialog(
              title: Text('Error'),
              content: Text('Please enter both ID and password.'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(this.context), child: Text('OK'))
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
      Navigator.pushNamed(this.context, '/pizzas', arguments: "Welcome, ${matchedUser.name}!");
    } else {
      showDialog(
        context: this.context,
        builder: (_) =>
            AlertDialog(
              title: Text('Login Failed'),
              content: Text('Invalid ID or password.'),
              actions: [
                TextButton(onPressed: () => Navigator.pop(this.context),
                    child: Text('Try Again'))
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
            SizedBox(height: 10,),
            Text('Login', style: TextStyle(fontSize: 25),),
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: 'ID',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            Column(
              children: [
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () {
                      login();
                      },
                    child: Text('Login')
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/register', arguments: "Data coming using named route");
                }, child: Text('Register'))
              ],
            )
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
    initialiazeDatabase();
  }

  // define the function
  Future<void> initialiazeDatabase() async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, 'Pizzeria.db');
    database =
    await openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, password TEXT)');
    }, onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < 2) {
        await db.execute('ALTER TABLE users ADD COLUMN text TEXT');
      }
    });
    await refreshUsers(); // load initial data
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
            password: maps[i]['password']);
      });
    });
  }

  // create insert function
  Future<void> insertUser(User user) async {
    final data = {
      'name': user.name,
      'age': user.age,
      'password' : user.password,
    };

    await database!.insert(
      'users',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await refreshUsers();
  }

  // create update function
  Future<void> updateUser(User user) async {
    await database!
        .update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
    await refreshUsers();
  }

  // create a delete function
  Future<void> deleteUser(int id) async {
    await database!.delete('users', where: 'id = ?', whereArgs: [id]);
    await refreshUsers();
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
            Text('Register', style: TextStyle(fontSize: 25),),
            SizedBox(height: 10,),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Age',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: _confirmController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final name = _nameController.text.trim();
                    final age = int.tryParse(_ageController.text) ?? 0;
                    final password = _passwordController.text.trim();
                    final confirm = _confirmController.text.trim();

                    if (name.isEmpty || age <= 0 || password.isEmpty || confirm.isEmpty) {
                      showDialog(
                        context: this.context,
                        builder: (_) => AlertDialog(
                          title: Text('Missing Info'),
                          content: Text('Please fill out all fields.'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(this.context), child: Text('OK'))
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
                            TextButton(onPressed: () => Navigator.pop(this.context), child: Text('OK'))
                          ],
                        ),
                      );
                      return;
                    } else {
                      await insertUser(User(id: 0, name: name, age: age, password: password));
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
                ElevatedButton(
                    onPressed: () async {
                      final id = int.tryParse(_idController.text);
                      final name = _nameController.text.trim();
                      final age = int.tryParse(_ageController.text) ?? 0;
                      final password = _passwordController.text.trim();
                      final confirm = _confirmController.text.trim();
                      if (id != null && name.isNotEmpty && age > 0 && password.isNotEmpty && confirm.isNotEmpty && password == confirm) {
                        await updateUser(
                            User(id: id, name: name, age: age, password: password));
                        clearForm();
                      }
                    },
                    child: Text('Update')),
                ElevatedButton(
                    onPressed: () async {
                      final id = int.tryParse(_idController.text);
                      if (id != null) {
                        await deleteUser(id);
                        clearForm();
                      }
                    },
                    child: Text('Delete')),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Display the dog instances

            Expanded(
                child: userList.isEmpty
                    ? Center(
                  child: Text('No Data Found'),
                )
                    : ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      final user = userList[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('hi'),
                          ),
                          title: Text(user.name),
                          subtitle: Text(
                              'Age : ${user.age}'),
                        ),
                      );
                    }))
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizzas'),
        backgroundColor: Colors.purpleAccent,
      ),
    );
  }
}


class User {
  final int? id;
  final String name;
  final int age;
  final String password;

  User(
      {required this.id,
        required this.name,
        required this.age,
        required this.password});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age, password : $password}';
  }
}