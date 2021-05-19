import 'package:flutter/material.dart';

class InputData extends StatelessWidget {
  final String hintTextInput;
  final _userNameFocusNode = FocusNode();
  double marginBottom;

  InputData(this.hintTextInput, this.marginBottom);

  @override
  Widget build(BuildContext context) {
    if (marginBottom == null) {
      marginBottom = 5;
    }

    return Container(
      margin: EdgeInsets.all(marginBottom),
      padding: EdgeInsets.all(5),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintTextInput,
        ),
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_userNameFocusNode);
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please provide your username';
          }
          return null;
        },
      ),
    );
  }
}
