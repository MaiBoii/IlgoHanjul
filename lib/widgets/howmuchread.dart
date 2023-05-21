import 'package:ilgohanjul/const/colors.dart';
import 'package:flutter/material.dart';

class HowMuchRead extends StatelessWidget{
  final int startPage;
  final int endPage;
  final int totalPage;
  final String book;
  final String author;
  final String publish;

  const HowMuchRead({
    required this.startPage,
    required this.endPage,
    required this.totalPage,
    required this.book,
    required this.author,
    required this.publish,
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: PRIMARY_COLOR,
        ),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(width: 30.0),
              _Book(
                book: book,
                author: author,
                publish: publish,
              ),
              SizedBox(width: 16.0),
              _Page(
                startPage: startPage,
                endPage: endPage,
                totalPage: totalPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final int startPage;
  final int endPage;
  final int totalPage;

  const _Page({
    required this.startPage,
    required this.endPage,
    required this.totalPage,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: PRIMARY_COLOR,
      fontSize: 14.0
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${startPage}p',
          style: textStyle,
        ),
        SizedBox(width: 10.0,),
        Text(
          '${endPage}p',
          style: textStyle,
        ),
        SizedBox(width: 10.0,),
        Text(
          '${totalPage}p',
          style: textStyle,
        ),
      ],
    );
  }
}

class _Book extends StatelessWidget {
  final String book;
  final String author;
  final String publish;

  const _Book({
    required this.book,
    required this.author,
    required this.publish,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Text(
        book,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: PRIMARY_COLOR,
          fontSize: 30.0
        ),
      )
    );
  }
}