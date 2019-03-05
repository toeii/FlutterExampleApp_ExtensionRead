
import 'dart:async';

import 'package:flutter_extension_read/model/BrowseRecordBean.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///DB
class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Logs.db');

//    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableNote($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $pointId TEXT, $title TEXT, $content TEXT, $url TEXT, $image TEXT)');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }


  ///===========Note===========
  final String tableNote = 'VisitorLogTable';
  final String columnId = 'id';
  final String pointId = 'pointId';
  final String title = 'title';
  final String content = 'content';
  final String url = 'url';
  final String image = 'image';

  Future<int> saveNote(BrowseRecordBean note) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableNote, note.toMap());
//    var result = await dbClient.rawInsert(
//        'INSERT INTO $tableNote ($columnTitle, $columnDescription) VALUES (\'${note.title}\', \'${note.description}\')');

    return result;
  }

  Future<List> getAllNotes() async {
    var dbClient = await db;
//    var result = await dbClient.query(tableNote, columns: [
//      columnId, pointId, title, content, url, image]);
    var result = await dbClient.rawQuery('SELECT * FROM $tableNote');

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableNote'));
  }

  Future<BrowseRecordBean> getNote(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableNote,
        columns: [
          columnId,
          pointId,
          title,
          content,
          url,
          image,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');

    if (result.length > 0) {
      return new BrowseRecordBean.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteNote(String id) async {
    var dbClient = await db;
    return await dbClient.delete(
        tableNote, where: '$columnId = ?', whereArgs: [id]);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

  Future<int> cleanNote() async {
    var dbClient = await db;
    return await dbClient.delete(tableNote);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

  Future<int> updateNote(BrowseRecordBean note) async {
    var dbClient = await db;
    return await dbClient.update(
        tableNote, note.toMap(), where: "$columnId = ?", whereArgs: [note.id]);
//    return await dbClient.rawUpdate(
//        'UPDATE $tableNote SET $columnTitle = \'${note.title}\', $columnDescription = \'${note.description}\' WHERE $columnId = ${note.id}');
  }

  ///===========other===========


}