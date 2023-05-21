import 'package:drift/drift.dart' hide Column;
import 'package:get_it/get_it.dart';
import 'package:ilgohanjul/database/drift_database.dart';
import 'package:ilgohanjul/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class ReadInputSheet extends StatefulWidget {
  final DateTime selectedDate;

  const ReadInputSheet ({
    required this.selectedDate, 
    Key? key
  }) : super(key: key);

  @override
  State<ReadInputSheet> createState() => _ReadInputSheetState();
}

class _ReadInputSheetState extends State<ReadInputSheet> {
  final GlobalKey<FormState> formKey = GlobalKey(); //폼 key 생성하기

  //자료형 뒤에 ?를 넣으면 null허용 변수라는 뜻임
  int? startPage;
  int? endPage;
  String? title;

  @override 
  Widget build(BuildContext context){
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    
    return Form( //텍스트 필드를 한 번에 관리할 수 있게하는 폼
      key: formKey, //Form을 조작할 키 값
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + bottomInset,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 8,right:8, top:8, bottom: bottomInset),
            child: Column(
              children: [
            SizedBox(height: 8.0,),
            Expanded(
            child: CustomTextField(
            label: '(카카오 API로 책제목/작가명/출판사명/총 페이지수 갖고 오는 위젯)',
            isPage: false,
            onSaved: (String? val) {
              title = val;
            },
            validator: titleValidator,
          ),
          ),
          SizedBox(height: 10.0),
          Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: '어디부터?',
                        isPage: true,
                        onSaved: (String? val) {
                          startPage = int.parse(val!);
                        },
                        validator: pageValidator,
                      ),
                    ),
                    const SizedBox(width: 16.0,),
                    Expanded(
                      child: CustomTextField(
                        label: '여기까지!',
                        isPage: true,
                        onSaved: (String? val) {
                          endPage = int.parse(val!);
                        },
                        validator: pageValidator,
                      ),
                    ),
                  ],
                ),
        SizedBox(height: 200.0),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onSavePressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: Text(
              '기 록 하 기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
            ),
          ),
        ),
            ],
          ),
        ),
      ),
    ),
    );
    
  }
void onSavePressed() async {
    if(formKey.currentState!.validate()){ //폼 검증하기
      formKey.currentState!.save(); //폼 저장하기

      await GetIt.I<LocalDatabase>().createBook(
        BooksCompanion(
          startPage: Value(startPage!),
          endPage: Value(endPage!),
          title: Value(title!),
          date: Value(widget.selectedDate)
        )
      );

    Navigator.of(context).pop();
  }
}


//페이지값 검증
  String? pageValidator(String? val) { 
    if(val == null) {
      return '페이지 값을 입력해주세요!';
    } 
  int? number;

  try {
    number = int.parse(val);
  } catch(e) {
    return '숫자를 입력해주셔야 합니다!';
  }

  if (number < 0) {
    return '페이지 수로 양수를 입력해주세요!';
  }

  return null;
}
  //제목값 검증
  String? titleValidator(String? val) {
    if(val == null || val.length == 0){
      return '제목을 입력해주셔야합니다!';
    }
  } 
}