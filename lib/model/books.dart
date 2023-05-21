import 'package:drift/drift.dart';

class Books extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get startPage => integer()();
  IntColumn get endPage => integer()();
 }