import 'package:ilgohanjul/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ilgohanjul/database/drift_database.dart';

class BookCard extends StatefulWidget {
  final String isbnl;
  final int totalPage;
  final String title;
  final String author;
  final String publish;

  const BookCard({
    required this.isbnl,
    required this.totalPage,
    required this.title,
    required this.author,
    required this.publish,
    Key? key,
  }): super(key: key);

  @override 
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard>{

  @override
  Widget build(BuildContext context){
    // final List<String> titles = <String>['죄와 벌','이크! 벌레가 되었어요','아무제목','뭐 쓰지'];
    // final List<String> authors = <String>['도스토옙스키','프란츠 카프카','아무작가','아무작가'];
    // final List<String> publishes = <String>['민음사','시공사','나무야미안해','민음사'];
    // final List<int> totalPages = <int>[450,253,623,123];

    return Container(
      margin: EdgeInsets.all(5),
      width: double.infinity,
      height: 150.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: PRIMARY_COLOR,
        ),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ],
          ),
        ),
      ),
    );
  }
  }
