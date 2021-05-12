import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svi_time_clock_app/widgets/input_data.dart';
import 'package:svi_time_clock_app/widgets/text_plain.dart';
import 'package:svi_time_clock_app/widgets/title_main.dart';

class LoginSecretKeyScreen extends StatelessWidget {
  static const routeName = '/login-secretkey';
  @override
  Widget build(BuildContext context) {
    final Color _buttonColor = Colors.deepPurpleAccent[400];
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: CupertinoPageScaffold(
          child: GestureDetector(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TitleMain('SVI Time Clocck'),
                  TextPlain(
                      'Login to your account fadter without entering username and password'),
                  InputData('Key Display Name'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
