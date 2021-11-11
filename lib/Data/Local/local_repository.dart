
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class LocalDataSource {
  Database? _database;
  List<String> currentCities = [];

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'city_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE City (name varchar(100) unique, primary key (name))');
  }

  Future<bool> checkCityExists(String name) async {
    final db = await database;
    try {
      var cityMap = await db
          .rawQuery('SELECT * FROM City WHERE name = ?', [name]);
      print(cityMap);
      return cityMap.isNotEmpty;
    } catch (e) {
      print("checkCityExists Error: Failed to query the data base");
      return true;
    }
  }

  Future<String> updateCity(String name) async {
    final db = await database;
    try {
      if (await checkCityExists(name)) {
        var value = await db.rawQuery('DELETE FROM City WHERE name = ?', [name]);
        print("hey");
        print("CHHHHHHHHHHHHHHHHHHHHHHHHH $value");
        await updateCities();
        return 'Deleted $name}';

      } else {
        await db.rawQuery('INSERT INTO City (name) Values (?)', [name]);
        await updateCities();
        return 'Added $name}';
      }
    } catch (e) {
      return "There was an error, please try again";
    }

  }

  Future<void> updateCities() async {
    final db = await database;
    currentCities = [];
    var values = await db.rawQuery('Select name From City');
    print(values);
    for (int i = 0; i < values.length; i++) {
      String currentName = values[i]['name'] as String;
      currentCities.add(currentName);
    }

  }



}
