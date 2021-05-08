import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  final String hintTextInput;

  InputPassword(this.hintTextInput);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintTextInput,
        ),
      ),
    );
  }
}
