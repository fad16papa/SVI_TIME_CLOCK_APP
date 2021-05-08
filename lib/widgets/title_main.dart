import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleMain extends StatelessWidget {
  final String titleApp;

  TitleMain(this.titleApp);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      child: Text(
        titleApp,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
