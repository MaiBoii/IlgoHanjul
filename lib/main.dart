import 'package:flutter/material.dart';
import 'package:ilgohanjul/screen/calendar_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ilgohanjul/database/drift_database.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  final database = LocalDatabase(); //데이터베이스 생성하기

  //get_it 패키지는 종속성 주입을 위한 기술이다.
  GetIt.I.registerSingleton<LocalDatabase>(database);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '읽고한줄',
      theme: ThemeData(
        fontFamily: "bukuku",
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalendarScreen(),
    );
  }
}
