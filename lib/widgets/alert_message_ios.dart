import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertMessageIOS extends StatelessWidget {
  final String title;
  final String content;

  AlertMessageIOS(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: CupertinoAlertDialog(
        title: new Text(
          title,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black87),
        ),
        content: new Text(
          content,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black87),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
