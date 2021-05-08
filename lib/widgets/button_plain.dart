import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonPlain extends StatelessWidget {
  final String textButton;
  final Function functionButton;

  ButtonPlain(this.textButton, this.functionButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: CupertinoButton(
        disabledColor: CupertinoColors.inactiveGray,
        borderRadius: BorderRadius.circular(20),
        child: Text(
          textButton,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Theme.of(context).primaryColor),
        ),
        onPressed: functionButton,
      ),
    );
  }
}
