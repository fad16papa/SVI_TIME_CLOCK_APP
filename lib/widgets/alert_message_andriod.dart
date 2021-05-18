import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertMessageAndriod extends StatelessWidget {
  final String title;
  final String content;

  AlertMessageAndriod(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        title: new Text(
          title,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w600, fontSize: 21, color: Colors.black87),
        ),
        content: new Text(
          content,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87),
        ),
        actions: <Widget>[
          new TextButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
