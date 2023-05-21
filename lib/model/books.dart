import 'package:drift/drift.dart';

class Books extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get author => text()();
  TextColumn get publish => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get startPage => integer()();
  IntColumn get endPage => integer()();
  IntColumn get totalPage => integer()();
 }