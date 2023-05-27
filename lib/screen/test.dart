import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ilgohanjul/const/api.dart';

class BookCard extends StatefulWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {

  TextEditingController _editingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            icon: Icon(Icons.search), 
            hintText: '검색어를 입력하세요',
            enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
        },
        child: Icon(Icons.search),
      ),
      body: Container(
        child: Center(
          child: Text('API 받아오기 테스트', style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }

  Future<String?> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=${_editingController.text}';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK ${API_KEY}"});
    print(response.body);
    return "Success!!";
  }
}
