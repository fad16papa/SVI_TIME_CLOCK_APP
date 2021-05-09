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
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 2.0, color: Theme.of(context).primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
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
      ),
    );
  }
}
