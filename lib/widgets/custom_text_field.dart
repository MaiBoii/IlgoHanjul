import 'package:ilgohanjul/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPage;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  const CustomTextField({
    required this.label,
    required this.isPage,
    required this.onSaved,
    required this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          flex: isPage ? 0 : 1,
          child: TextFormField(
            onSaved: onSaved, //폼 저장했을 때 실행할 함수
            validator: validator, //폼 검증했을 때 실행할 함수
            cursorColor: Colors.grey,
            maxLines: isPage ? 1 : null,
            expands: !isPage,
            keyboardType: isPage ? TextInputType.number : TextInputType.multiline,
            inputFormatters: isPage 
                ? [
              FilteringTextInputFormatter.digitsOnly,
            ] : [],
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[300],
              suffixText: isPage ? 'p' : null,
            ),
          ),
        )
      ],
    );
  }
}