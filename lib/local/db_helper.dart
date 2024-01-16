import 'dart:convert';

import 'package:edu_flo/model/db/login_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LoginDatabase {
  static final LoginDatabase instance = LoginDatabase._init();

  static Database? _database;

  LoginDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB('login.db');
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableLogin ( 
  ${LoginFields.id} $idType, 
  ${LoginFields.username} $textType,
  ${LoginFields.email} $textType,
  ${LoginFields.password} $textType
  )
''');
  }

  Future<Login> create(Login login) async {
    final db = await instance.database;
    final id = await db.insert(tableLogin, login.toJson());
    return login.copy(id: id);
  }

  Future<Login> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableLogin,
      columns: LoginFields.values,
      where: '${LoginFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Login.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Login>> readAll() async {
    final db = await instance.database;
    final result = await db.query(tableLogin);
    return result.map((json) => Login.fromJson(json)).toList();
  }

  Future<int> update(Login login) async {
    final db = await instance.database;
    return db.update(
      tableLogin,
      login.toJson(),
      where: '${LoginFields.id} = ?',
      whereArgs: [login.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableLogin,
      where: '${LoginFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
