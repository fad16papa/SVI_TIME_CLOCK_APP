import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInMainScreen extends StatefulWidget {
  static const routeName = '/loing-main';

  @override
  _LogInMainScreenState createState() => _LogInMainScreenState();
}

class _LogInMainScreenState extends State<LogInMainScreen> {
  final _form = GlobalKey<FormState>();
  final _userName = FocusNode();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height,
      width: deviceSize.width,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'SVI Time Clock',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
