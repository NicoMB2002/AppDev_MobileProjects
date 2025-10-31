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
      home: ScreenInterface(),
    );
  }
}

class ScreenInterface extends StatefulWidget {
  const ScreenInterface({super.key});

  @override
  State<ScreenInterface> createState() => _ScreenInterfaceState();
}

class _ScreenInterfaceState extends State<ScreenInterface> {
  // create a database instance
  Database? database;
  List<Dog> dogList = []; // create a container to store the dog instance

  // create the controller
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _brandController = TextEditingController();

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
    final path = join(dbpath, 'animaldatabase.db');
    database =
    await openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute(
          'create table dogs(id integer primary key autoincrement, name text, age integer, brand text)');
    }, onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < 2) {
        await db.execute('Alter Table dogs add column text Text');
      }
    });
    await refreshDogs(); // load initial data
  }

  // define the function
  Future<void> refreshDogs() async {
    if (database == null) return;
    final List<Map<String, dynamic>> maps = await database!.query('dogs');
    setState(() {
      dogList = List.generate(maps.length, (i) {
        return Dog(
            id: maps[i]['id'],
            name: maps[i]['name'],
            age: maps[i]['age'],
            brand: maps[i]['brand']);
      });
    });
  }

  // create insert function
  Future<void> insertDog(Dog dog) async {
    final data = {
      'name': dog.name,
      'age': dog.age,
      'brand' : dog.brand,
    };

    await database!.insert(
      'dogs',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await refreshDogs();
  }

  // create update function
  Future<void> updateDog(Dog dog) async {
    await database!
        .update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
    await refreshDogs();
  }

  // create a delete function
  Future<void> deleteDog(int id) async {
    await database!.delete('dogs', where: 'id = ?', whereArgs: [id]);
    await refreshDogs();
  }

// create a function to clear the forms
  void clearForm() {
    _idController.clear();
    _nameController.clear();
    _ageController.clear();
    _brandController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: 'ID',
              ),
              keyboardType: TextInputType.number,
            ),
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
              controller: _brandController,
              decoration: InputDecoration(
                labelText: 'Brand',
              ),
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
                      final brand = _brandController.text.trim();
                      if (name.isNotEmpty && age > 0) {
                        await insertDog(
                            Dog(id: 0, name: name, age: age, brand: brand));
                        clearForm();
                      }
                    },
                    child: Text('Add')),
                ElevatedButton(
                    onPressed: () async {
                      final id = int.tryParse(_idController.text);
                      final name = _nameController.text.trim();
                      final age = int.tryParse(_ageController.text) ?? 0;
                      final brand = _brandController.text.trim();
                      if (id != null && name.isNotEmpty && age > 0) {
                        await updateDog(
                            Dog(id: id, name: name, age: age, brand: brand));
                        clearForm();
                      }
                    },
                    child: Text('update')),
                ElevatedButton(
                    onPressed: () async {
                      final id = int.tryParse(_idController.text);
                      if (id != null) {
                        await deleteDog(id);
                        clearForm();
                      }
                    },
                    child: Text('Delete')),
                ElevatedButton(
                    onPressed: () async {
                      await refreshDogs();
                    },
                    child: Text('show List'))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Display the dog instances

            Expanded(
                child: dogList.isEmpty
                    ? Center(
                  child: Text('no Data Found'),
                )
                    : ListView.builder(
                    itemCount: dogList.length,
                    itemBuilder: (context, index) {
                      final dog = dogList[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${dog.id}'),
                          ),
                          title: Text(dog.name),
                          subtitle: Text(
                              'Age : ${dog.age} | Brand : ${dog.brand}'),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class Dog {
  final int? id;
  final String name;
  final int age;
  final String brand;

  Dog(
      {required this.id,
        required this.name,
        required this.age,
        required this.brand});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'brand': brand,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age, brand : $brand}';
  }
}