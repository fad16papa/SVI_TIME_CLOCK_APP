import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svi_time_clock_app/screens/login_password_screen.dart';
import 'package:svi_time_clock_app/widgets/button_color.dart';
import 'package:svi_time_clock_app/widgets/button_plain.dart';
import 'package:svi_time_clock_app/widgets/divider_custom.dart';
import 'package:svi_time_clock_app/widgets/input_data.dart';
import 'package:svi_time_clock_app/widgets/title_main.dart';

class LogInMainScreen extends StatefulWidget {
  static const routeName = '/login-main';

  @override
  _LogInMainScreenState createState() => _LogInMainScreenState();
}

class _LogInMainScreenState extends State<LogInMainScreen> {
  final Color _buttonColor = Colors.deepPurpleAccent[400];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      child: GestureDetector(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TitleMain('SVI Time Clock'),
              InputData('UserName'),
              ButtonColor('Log In with Security Key', () {}, _buttonColor),
              ButtonColor('Log In with Biometrics', () {}, _buttonColor),
              DividerCustom('OR'),
              ButtonPlain('Log In with Password', () {
                Navigator.of(context)
                    .pushReplacementNamed(LogInPasswordScreen.routeName);
              })
            ],
          ),
        ),
      ),
    );
  }
}
