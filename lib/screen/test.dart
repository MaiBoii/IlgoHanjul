import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ilgohanjul/const/api.dart';

class BookCard extends StatefulWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
      body: Container(
        child: Center(
          child: Text('test'),
        ),
      ),
    );
  }

  Future<String?> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=해커와 화가';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK ${API_KEY}"});
    print(response.body);
    return "Success!!";
  }
}
