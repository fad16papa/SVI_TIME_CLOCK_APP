import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextPlain extends StatelessWidget {
  final String description;

  TextPlain(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      child: Text(
        description,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
