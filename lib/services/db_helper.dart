import 'package:flutter/foundation.dart';
import 'package:balivibesresto_app/dto/food.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _db;

  factory DBHelper() => _instance;

  DBHelper._internal();

  Future<Database> get db async {
    _db ??= await initDatabase();
    return _db!; // Use the already initialized _db
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'db_foods.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE foods (id INTEGER PRIMARY KEY, title TEXT)');
  }

  Future<Foods> add(Foods foods) async {
    var dbClient = await db;
    foods.id = await dbClient.insert('foods', foods.toMap());
    return foods;
  }

  Future<List<Foods>> getFoods() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps =
        await dbClient.query('foods', orderBy: 'id DESC');
    List<Foods> foods = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        foods.add(Foods.fromMap(maps[i]));
      }
    }
    return foods;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'foods',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Foods foods) async {
    var dbClient = await db;
    return await dbClient.update(
      'foods',
      foods.toMap(),
      where: 'id = ?',
      whereArgs: [foods.id],
    );
  }

  Future<void> close() async {
    try {
      // Access database client
      var dbClient = await db;
      _db = null;
      await dbClient.close();
    } catch (error) {
      // Handle potential errors during closure
      debugPrint('Error closing database: $error');
    }
  }
}