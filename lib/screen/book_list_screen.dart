import 'package:flutter/material.dart';
import 'package:ilgohanjul/const/colors.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: LIGHT_GREY_COLOR,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '당신의 기록들',
          style: TextStyle(
            color: LIGHT_GREY_COLOR
          ),
        ),
        backgroundColor: PRIMARY_COLOR,
      ),
      
    );
  }
}