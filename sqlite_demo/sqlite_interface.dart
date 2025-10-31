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
      home: DInterface(),
    );
  }
}

class DInterface extends StatefulWidget {
  const DInterface({super.key});

  @override
  State<DInterface> createState() => _DInterfaceState();
}

class _DInterfaceState extends State<DInterface> {
  // initialize the database object

  late Database database;
  List<Dog> doglist = [];

  // controllers for the user entry point

  final _nameController = TextEditingController();
  final TextEditingController _agecontroller = TextEditingController();
  final _brandController = TextEditingController();

  //create an instance for the Dog model class
  Dog? currentDog;

  // call an initstate method to connect the database to the flutter project
  // this method will run automatically when we launch the app from flutter

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDatabase();
  }

  // define the method
  Future<void> initializeDatabase() async {
    database = await openDatabase(join(await getDatabasesPath(), 'dogList.db'),
        onCreate: (db, version) {
          return db.execute(
            'create table dogs(id integer primary key, name text, age integer, brand text)',
          );
        }, version: 1);
    // since user can add multiple Dog objects, we have to write a method to update the new value
    refreshDogs();
  }

  // define the method
  Future<void> refreshDogs() async {
    final List<Map<String, dynamic>> maps = await database.query('dogs');
    setState(() {
      doglist = List.generate(maps.length, (i) {
        // generate function will help i to increment the value until the end of the container
        return Dog(
            id: maps[i]['id'],
            name: maps[i]['name'],
            age: maps[i]['age'],
            brand: maps[i]['brand']);
      });
    });
  }

  //insert a dog object to db
  Future<void> insertDog(Dog dog) async {
    await database.insert('dogs', dog.toMap(),
        // this map function is used to convert dog dart object to db object
        conflictAlgorithm:
        ConflictAlgorithm.replace //this is used to solve the id error
    );
    refreshDogs();
  }

  //update the dog object
  Future<void> updateDog(Dog dog) async {
    await database
        .update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
    refreshDogs();
  }

  //delete a dog
  Future<void> deleteDog(int id) async {
    await database.delete('dogs', where: 'id = ?', whereArgs: [id]);
    refreshDogs();
  }

  // clear the textediting field
  void clearForm() {
    _nameController.clear();
    _agecontroller.clear();
    _brandController.clear();
    currentDog = null;
  }

  // show a dialog to add or update
  void showFormDialog({Dog? dog}) {
    if (dog != null) {
      _nameController.text = dog.name;
      _agecontroller.text = dog.age.toString();
      _brandController.text = dog.brand;
      currentDog = dog;
    }

    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
            title: Text(dog == null ? 'Add Dog' : 'update Dog'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _agecontroller,
                  decoration: InputDecoration(labelText: 'Age'),
                ),
                TextField(
                  controller: _brandController,
                  decoration: InputDecoration(labelText: 'Brand'),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    clearForm();
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    final name = _nameController.text;
                    final age = int.parse(_agecontroller.text) ?? 0;
                    final brand = _brandController.text;

                    if (name.isNotEmpty && age > 0) {
                      if (currentDog == null) {
                        insertDog(
                            Dog(id: 0, name: name, age: age, brand: brand));
                      } else {
                        updateDog(Dog(
                            id: currentDog!.id,
                            name: name,
                            age: age,
                            brand: brand));
                      }
                      Navigator.of(context).pop();
                      clearForm();
                    }
                  },
                  child: Text(dog == null ? 'Add' : 'Update'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: doglist.length,
                itemBuilder: (context, index) {
                  final dog = doglist[index];
                  return ListTile(
                    title: Text(dog.name),
                    subtitle: Text('Age: ${dog.age}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () => showFormDialog(),
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () => deleteDog(dog.id),
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () => showFormDialog(), child: Text('Add Dog')),
                ElevatedButton(
                    onPressed: () => refreshDogs(),
                    child: Text('Show refresh list')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Dog {
  final int id;
  final String name;
  final int age;
  final String brand;

  Dog({
    required this.id,
    required this.name,
    required this.age,
    required this.brand,
  });

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
    return 'Dog{id: $id, name: $name, age: $age, brand: $brand}';
  }
}