import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svi_time_clock_app/providers/authentication_provider.dart';
import 'package:svi_time_clock_app/screens/login_password_screen.dart';
import 'package:svi_time_clock_app/widgets/alert_message_andriod.dart';
import 'package:svi_time_clock_app/widgets/alert_message_ios.dart';
import 'package:svi_time_clock_app/widgets/button_color.dart';
import 'package:svi_time_clock_app/widgets/button_plain.dart';
import 'package:svi_time_clock_app/widgets/divider_custom.dart';
import 'package:svi_time_clock_app/widgets/title_main.dart';

class LogInMainScreen extends StatefulWidget {
  static const routeName = '/login-main';

  @override
  _LogInMainScreenState createState() => _LogInMainScreenState();
}

class _LogInMainScreenState extends State<LogInMainScreen> {
  final _userNameController = TextEditingController();
  final Color _buttonColor = Colors.deepPurpleAccent[400];
  bool isAuthResult = false;

  //This will check if the fingerprint scanner, touchID or faceID of the user mobile is enable.
  Future authenticateBiometrics(String userName) async {
    isAuthResult =
        await Provider.of<AuthenticationProvider>(context, listen: false)
            .checkBiometric();

    if (isAuthResult) {
      //This will call the preAuthenticate route of FIDO2 to get the challange token
      //to authenticate the user.
      try {
        var responsPreAuthenticate =
            await Provider.of<AuthenticationProvider>(context, listen: false)
                .preAuthenticated(userName);

        if (responsPreAuthenticate.response.allowCredentials == null &&
            responsPreAuthenticate.response.challenge == null) {
          //This will return the showDialog alert box for Unable to login
          if (Platform.isIOS) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertMessageIOS(
                    "Unable to log in", "<Insert Error Message here>");
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertMessageAndriod(
                    "Unable to log in", "<Insert Error Message here>");
              },
            );
          }
        }
      } catch (error) {}

      // var responseAuthenticate =
      //     await Provider.of<AuthenticationProvider>(context, listen: false)
      //         .authenticated();
    }

    return isAuthResult;
  }

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
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'UserName',
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus();
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide your username';
                    }
                    return null;
                  },
                ),
              ),
              ButtonColor('Log In with Security Key', () {}, _buttonColor),
              ButtonColor(
                'Log In with Biometrics',
                () {
                  authenticateBiometrics(_userNameController.text);
                },
                _buttonColor,
              ),
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
