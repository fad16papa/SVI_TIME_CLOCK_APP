import 'package:flutter/material.dart';

class InputData extends StatelessWidget {
  final String hintTextInput;
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
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintTextInput,
        ),
      ),
    );
  }
}
