// ignore_for_file: unused_field, prefer_const_declarations, unused_import, unused_local_variable, non_constant_identifier_names, body_might_complete_normally_nullable


import 'package:db_example/models/car.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  
  static final _databaseName = "cardb.db";
  static final _databaseVersion = 1;
  static final table = "cars_table";
  static final columnId = "id";
  static final columnName = "name";
  static final columnMiles = "miles";
  static final columnPrice = "price";
  static final columnImagePath = "imagePath";
  

  DatabaseHelper._privateConstructor(); 

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }
  
  _initDatabase() async {
     String path = join(await getDatabasesPath(), _databaseName);
     return await openDatabase(path,version: _databaseVersion,onCreate: _onCreate);
  }


  Future _onCreate (Database db, int version) async {
    await db.execute('''
   
   CREATE TABLE $table (
    $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $columnName TEXT NOT NULL,
    $columnMiles INTEGER NOT NULL,
    $columnPrice INTEGER NOT NULL,
    $columnImagePath TEXT
   )
''');
  }

  Future<int> insert(Car car) async{
   Database? db = await instance.database;
   return await db!.insert(table, {"name" : car.name, "miles": car.miles, "price" : car.price,"imagePath": car.imagePath});
  }

  Future<int> update(Car car) async {
    Database? db = await instance.database;
    int id = car.toMap()["id"];
    return await db!.update(table, car.toMap(),where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<List<Map<String,dynamic>>> queryRows(name) async { 
    Database? db = await instance.database;
    return await db!.query(table,where: "$columnName LIKE  '%$name%' ");
  }

  Future<List<Map<String,dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(await db!.rawQuery("SELECT COUNT(*) FROM $table "));
  }
}