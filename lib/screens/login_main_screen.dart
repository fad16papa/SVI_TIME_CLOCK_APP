import 'package:flutter/cupertino.dart';
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

    return CupertinoPageScaffold(
      child: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'SVI Time Clock',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'UserName'),
            ),
            CupertinoButton.filled(
              borderRadius: BorderRadius.circular(20),
              child: Text('Log In with a Security Key'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
