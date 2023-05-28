import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ilgohanjul/const/api.dart';
import 'package:ilgohanjul/const/colors.dart';
import 'dart:convert';

class BookCard extends StatefulWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  String result = '';
  List data = [];
  TextEditingController _editingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: TextField(
          controller: _editingController,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            icon: Icon(Icons.search), 
            hintText: '검색어를 입력하세요',
            enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {;
          data.clear();
          getJSONData();
        },
        child: Icon(Icons.search),
      ),

      body: Container(
        child: Center(
          child: data.length == 0 ? 
          Text("데이터가 없습니다.", style: TextStyle(fontSize: 20))
          : ListView.builder(itemBuilder: (context, index) {            
            return Card(
              child: Container(
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
              // child: Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              //   child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                            Image.network(
                                    data[index]['thumbnail'],
                                    fit: BoxFit.contain,
                                  ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                SizedBox(height: 30),
                                Text(data[index]['title'].toString(), style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,)),
                                Text(data[index]['authors'].toString().substring(1,data[index]['authors'].toString().length-1) ,style: TextStyle(fontSize: 10),),
                                Text(data[index]['publisher'].toString(),style: TextStyle(fontSize: 10),),
                              ]
                            )
                          ],
                  ),
                ),
              // ),
              // ),
            );
          }, itemCount: data.length,
          ),
        )
      ),
    );
  }

  Future<String?> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=${_editingController.text}';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK ${API_KEY}"});

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON["documents"];
      data.addAll(result);
    });
    return response.body;
  }
}
