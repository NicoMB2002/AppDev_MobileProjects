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
      routes: {
        '/': (context) => ScreenInterface(),
        '/register': (context) => Register(),
      },
    );
  }
}

class ScreenInterface extends StatefulWidget {
  const ScreenInterface({super.key});

  @override
  State<ScreenInterface> createState() => _ScreenInterfaceState();
}

class _ScreenInterfaceState extends State<ScreenInterface> {
  final _idController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _marksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Application'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _marksController,
              decoration: const InputDecoration(labelText: 'Marks'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final fName = _firstNameController.text.trim();
                final lName = _lastNameController.text.trim();
                final marks = double.tryParse(_marksController.text) ?? 0;

                if (fName.isNotEmpty && lName.isNotEmpty && marks > 0) {
                  // Create a user instance
                  final newUser = User(id: 0, fName: fName, lName: lName, marks: marks);

                  // Insert into database
                  final dbPath = await getDatabasesPath();
                  final path = join(dbPath, 'users.db');
                  final database = await openDatabase(path, version: 2);
                  await database.insert(
                    'users',
                    {
                      'fName': newUser.fName,
                      'lName': newUser.lName,
                      'marks': newUser.marks,
                    },
                    conflictAlgorithm: ConflictAlgorithm.replace,
                  );

                  // Clear form
                  _firstNameController.clear();
                  _lastNameController.clear();
                  _marksController.clear();

                  // Navigate to register screen
                  Navigator.pushNamed(
                    context,
                    '/register',
                    arguments: {
                      'idController': _idController,
                      'firstNameController': _firstNameController,
                      'lastNameController': _lastNameController,
                      'marksController': _marksController,
                    },
                  );
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Database? database;
  List<User> userList = [];

  late TextEditingController idController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController marksController;

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'users.db');
    database = await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, fName TEXT, lName TEXT, marks DOUBLE)',
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
          fName: maps[i]['fName'],
          lName: maps[i]['lName'],
          marks: maps[i]['marks'],
        );
      });
    });
  }

  Future<void> insertUser(User user) async {
    final data = {
      'fName': user.fName,
      'lName': user.lName,
      'marks': user.marks,
    };
    await database!.insert('users', data, conflictAlgorithm: ConflictAlgorithm.replace);
    await refreshUsers();
  }

  Future<void> updateUser(User user) async {
    await database!.update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
    await refreshUsers();
  }

  Future<void> deleteUser(int id) async {
    await database!.delete('users', where: 'id = ?', whereArgs: [id]);
    await refreshUsers();
  }

  void clearForm() {
    idController.clear();
    firstNameController.clear();
    lastNameController.clear();
    marksController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, TextEditingController>;
    idController = args['idController']!;
    firstNameController = args['firstNameController']!;
    lastNameController = args['lastNameController']!;
    marksController = args['marksController']!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Application'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(user.fName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.lName),
                  Text('${user.marks}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.grey),
                    onPressed: () {
                      idController.text = user.id.toString();
                      firstNameController.text = user.fName;
                      lastNameController.text = user.lName;
                      marksController.text = user.marks.toString();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () async {
                      await deleteUser(user.id!);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class User {
  final int? id;
  final String fName;
  final String lName;
  final double marks;

  User(
      {required this.id,
        required this.fName,
        required this.lName,
        required this.marks});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'fName': fName,
      'lName': lName,
      'marks': marks,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, fName: $fName, lName: $lName, marks: $marks}';
  }
}