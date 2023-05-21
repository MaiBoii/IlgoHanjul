import 'package:ilgohanjul/model/books.dart';
import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Books,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() :super(_openConnection());

  //SELECT문 구현
  Stream<List<Book>> watchBooks(DateTime date) =>
    (select(books)..where((tbl) => tbl.date.equals(date))).watch();

  //INSERT문 구현
  Future<int> createBook(BooksCompanion data)=>
    into(books).insert(data);

  //DELETE문 구현
  Future<int> removeBook(int id)=>
    (delete(books)..where((tbl) => tbl.id.equals(id))).go();

  @override
  int get schemaVersion => 1; 
}

LazyDatabase _openConnection(){
  return LazyDatabase(() async {

    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}