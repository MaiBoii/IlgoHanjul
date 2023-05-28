import 'package:flutter/material.dart';
import 'package:ilgohanjul/const/colors.dart';
import 'package:ilgohanjul/widgets/book_card.dart';

TextEditingController searchTextEditingController = TextEditingController();

emptyTheTextFormField() {searchTextEditingController.clear();}

class BookListScreen extends StatelessWidget {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: LIGHT_GREY_COLOR,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: LIGHT_GREY_COLOR,
        elevation: 0.0,
        title: 
        TextFormField(
              controller: searchTextEditingController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                filled: false,
                // fillColor: PRIMARY_COLOR,
                prefixIcon: Icon(Icons.search, color: Colors.black, size: 30),
                suffixIcon: IconButton(icon: Icon(Icons.clear, color: Colors.black,), 
                onPressed: emptyTheTextFormField)
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: PRIMARY_COLOR
              ),
            ),
          ),
      body: SingleChildScrollView(
            // TextFormField(
            //   controller: searchTextEditingController,
            //   decoration: InputDecoration(
            //     enabledBorder: UnderlineInputBorder(
            //       borderSide: BorderSide(color: Colors.black),
            //       ),
            //     focusedBorder: UnderlineInputBorder(
            //       borderSide: BorderSide(color: Colors.black),
            //     ),
            //     filled: false,
            //     // fillColor: PRIMARY_COLOR,
            //     prefixIcon: Icon(Icons.search, color: Colors.black, size: 30),
            //     suffixIcon: IconButton(icon: Icon(Icons.clear, color: Colors.black,), 
            //     onPressed: emptyTheTextFormField)
            //     ),
            //     style: TextStyle(
            //       fontSize: 20,
            //       color: PRIMARY_COLOR
            //   ),
            // ),
            
          scrollDirection: Axis.vertical,
          child: Column(
          children:[
            BookCard(
              isbnl: "_",
              totalPage: 464,
              title: '죄와 벌',
              author:"표도로 도스토옙스키",
              publish:"민음사",
            ),
            BookCard(
              isbnl: "_",
              totalPage: 464,
              title: '죄와 벌',
              author:"표도로 도스토옙스키",
              publish:"민음사",
            ),
            BookCard(
              isbnl: "_",
              totalPage: 464,
              title: '죄와 벌',
              author:"표도로 도스토옙스키",
              publish:"민음사",
            ),
            BookCard(
              isbnl: "_",
              totalPage: 464,
              title: '죄와 벌',
              author:"표도로 도스토옙스키",
              publish:"민음사",
            ),
            BookCard(
              isbnl: "_",
              totalPage: 464,
              title: '죄와 벌',
              author:"표도로 도스토옙스키",
              publish:"민음사",
            ),
            BookCard(
              isbnl: "_",
              totalPage: 464,
              title: '죄와 벌',
              author:"표도로 도스토옙스키",
              publish:"민음사",
            ),
          ]
      )
    ),
    );
  }
}