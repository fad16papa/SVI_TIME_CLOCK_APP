import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonColor extends StatelessWidget {
  final String textButton;
  final Function functionButton;
  final Color buttonColor;

  ButtonColor(this.textButton, this.functionButton, this.buttonColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: CupertinoButton(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
        child: Text(
          textButton,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        onPressed: functionButton,
      ),
    );
  }
}
