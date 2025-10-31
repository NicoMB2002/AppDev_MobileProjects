import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  WidgetsFlutterBinding.ensureInitialized();

  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database.
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );

  // Create a Dog and add it to the dogs table
  var fido = Dog(
    id: 0,
    name: 'Fido',
    age: 35,
  );

  await insertDog(fido, database);

  // Now, use the method above to retrieve all the dogs.
  print(await dogs(database)); // Prints a list that includes Fido.

  // Update Fido's age and save it to the database.
  fido = Dog(
    id: fido.id,
    name: fido.name,
    age: fido.age + 7,
  );
  await updateDog(fido, database);

  // Print the updated results.
  print(await dogs(database)); // Prints Fido with age 42.

  // Delete Fido from the database.
  await deleteDog(fido.id, database);

  // Print the list of dogs (empty).
  print(await dogs(database));
}

Future<Database> getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );
}

Future<void> insertDog(Dog dog, Future<Database> database) async {
  final db = await database;

  await db.insert(
    'dogs',
    dog.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Dog>> dogs(Future<Database> database) async {
  final db = await database;

  final List<Map<String, Object?>> dogMaps = await db.query('dogs');

  return [
    for (final dogMap in dogMaps)
      Dog(
        id: dogMap['id'] as int,
        name: dogMap['name'] as String,
        age: dogMap['age'] as int,
      ),
  ];
}

Future<void> updateDog(Dog dog, Future<Database> database) async {
  final db = await database;

  await db.update(
    'dogs',
    dog.toMap(),
    where: 'id = ?',
    whereArgs: [dog.id],
  );
}

Future<void> deleteDog(int id, Future<Database> database) async {
  final db = await database;

  await db.delete(
    'dogs',
    where: 'id = ?',
    whereArgs: [id],
  );
}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}