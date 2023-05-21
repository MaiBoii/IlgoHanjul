// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _publishMeta =
      const VerificationMeta('publish');
  @override
  late final GeneratedColumn<String> publish = GeneratedColumn<String>(
      'publish', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startPageMeta =
      const VerificationMeta('startPage');
  @override
  late final GeneratedColumn<int> startPage = GeneratedColumn<int>(
      'start_page', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endPageMeta =
      const VerificationMeta('endPage');
  @override
  late final GeneratedColumn<int> endPage = GeneratedColumn<int>(
      'end_page', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalPageMeta =
      const VerificationMeta('totalPage');
  @override
  late final GeneratedColumn<int> totalPage = GeneratedColumn<int>(
      'total_page', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, author, publish, date, startPage, endPage, totalPage];
  @override
  String get aliasedName => _alias ?? 'books';
  @override
  String get actualTableName => 'books';
  @override
  VerificationContext validateIntegrity(Insertable<Book> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('publish')) {
      context.handle(_publishMeta,
          publish.isAcceptableOrUnknown(data['publish']!, _publishMeta));
    } else if (isInserting) {
      context.missing(_publishMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('start_page')) {
      context.handle(_startPageMeta,
          startPage.isAcceptableOrUnknown(data['start_page']!, _startPageMeta));
    } else if (isInserting) {
      context.missing(_startPageMeta);
    }
    if (data.containsKey('end_page')) {
      context.handle(_endPageMeta,
          endPage.isAcceptableOrUnknown(data['end_page']!, _endPageMeta));
    } else if (isInserting) {
      context.missing(_endPageMeta);
    }
    if (data.containsKey('total_page')) {
      context.handle(_totalPageMeta,
          totalPage.isAcceptableOrUnknown(data['total_page']!, _totalPageMeta));
    } else if (isInserting) {
      context.missing(_totalPageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Book(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      publish: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}publish'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      startPage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_page'])!,
      endPage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_page'])!,
      totalPage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_page'])!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class Book extends DataClass implements Insertable<Book> {
  final int id;
  final String title;
  final String author;
  final String publish;
  final DateTime date;
  final int startPage;
  final int endPage;
  final int totalPage;
  const Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.publish,
      required this.date,
      required this.startPage,
      required this.endPage,
      required this.totalPage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['author'] = Variable<String>(author);
    map['publish'] = Variable<String>(publish);
    map['date'] = Variable<DateTime>(date);
    map['start_page'] = Variable<int>(startPage);
    map['end_page'] = Variable<int>(endPage);
    map['total_page'] = Variable<int>(totalPage);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      title: Value(title),
      author: Value(author),
      publish: Value(publish),
      date: Value(date),
      startPage: Value(startPage),
      endPage: Value(endPage),
      totalPage: Value(totalPage),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      author: serializer.fromJson<String>(json['author']),
      publish: serializer.fromJson<String>(json['publish']),
      date: serializer.fromJson<DateTime>(json['date']),
      startPage: serializer.fromJson<int>(json['startPage']),
      endPage: serializer.fromJson<int>(json['endPage']),
      totalPage: serializer.fromJson<int>(json['totalPage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'author': serializer.toJson<String>(author),
      'publish': serializer.toJson<String>(publish),
      'date': serializer.toJson<DateTime>(date),
      'startPage': serializer.toJson<int>(startPage),
      'endPage': serializer.toJson<int>(endPage),
      'totalPage': serializer.toJson<int>(totalPage),
    };
  }

  Book copyWith(
          {int? id,
          String? title,
          String? author,
          String? publish,
          DateTime? date,
          int? startPage,
          int? endPage,
          int? totalPage}) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        publish: publish ?? this.publish,
        date: date ?? this.date,
        startPage: startPage ?? this.startPage,
        endPage: endPage ?? this.endPage,
        totalPage: totalPage ?? this.totalPage,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('publish: $publish, ')
          ..write('date: $date, ')
          ..write('startPage: $startPage, ')
          ..write('endPage: $endPage, ')
          ..write('totalPage: $totalPage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, author, publish, date, startPage, endPage, totalPage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.title == this.title &&
          other.author == this.author &&
          other.publish == this.publish &&
          other.date == this.date &&
          other.startPage == this.startPage &&
          other.endPage == this.endPage &&
          other.totalPage == this.totalPage);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> author;
  final Value<String> publish;
  final Value<DateTime> date;
  final Value<int> startPage;
  final Value<int> endPage;
  final Value<int> totalPage;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.author = const Value.absent(),
    this.publish = const Value.absent(),
    this.date = const Value.absent(),
    this.startPage = const Value.absent(),
    this.endPage = const Value.absent(),
    this.totalPage = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String author,
    required String publish,
    required DateTime date,
    required int startPage,
    required int endPage,
    required int totalPage,
  })  : title = Value(title),
        author = Value(author),
        publish = Value(publish),
        date = Value(date),
        startPage = Value(startPage),
        endPage = Value(endPage),
        totalPage = Value(totalPage);
  static Insertable<Book> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? author,
    Expression<String>? publish,
    Expression<DateTime>? date,
    Expression<int>? startPage,
    Expression<int>? endPage,
    Expression<int>? totalPage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (author != null) 'author': author,
      if (publish != null) 'publish': publish,
      if (date != null) 'date': date,
      if (startPage != null) 'start_page': startPage,
      if (endPage != null) 'end_page': endPage,
      if (totalPage != null) 'total_page': totalPage,
    });
  }

  BooksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? author,
      Value<String>? publish,
      Value<DateTime>? date,
      Value<int>? startPage,
      Value<int>? endPage,
      Value<int>? totalPage}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      publish: publish ?? this.publish,
      date: date ?? this.date,
      startPage: startPage ?? this.startPage,
      endPage: endPage ?? this.endPage,
      totalPage: totalPage ?? this.totalPage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (publish.present) {
      map['publish'] = Variable<String>(publish.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (startPage.present) {
      map['start_page'] = Variable<int>(startPage.value);
    }
    if (endPage.present) {
      map['end_page'] = Variable<int>(endPage.value);
    }
    if (totalPage.present) {
      map['total_page'] = Variable<int>(totalPage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('publish: $publish, ')
          ..write('date: $date, ')
          ..write('startPage: $startPage, ')
          ..write('endPage: $endPage, ')
          ..write('totalPage: $totalPage')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $BooksTable books = $BooksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [books];
}
