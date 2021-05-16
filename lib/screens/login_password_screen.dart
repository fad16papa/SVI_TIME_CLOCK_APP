import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svi_time_clock_app/providers/authentication_provider.dart';
import 'package:svi_time_clock_app/widgets/button_color.dart';
import 'package:svi_time_clock_app/widgets/button_plain.dart';
import 'package:svi_time_clock_app/widgets/button_text.dart';
import 'package:svi_time_clock_app/widgets/divider_custom.dart';
import 'package:svi_time_clock_app/widgets/input_data.dart';
import 'package:svi_time_clock_app/widgets/input_password_data.dart';
import 'package:svi_time_clock_app/widgets/title_main.dart';

class LogInPasswordScreen extends StatefulWidget {
  static const routeName = '/login-password';

  @override
  _LogInPasswordScreenState createState() => _LogInPasswordScreenState();
}

class _LogInPasswordScreenState extends State<LogInPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final Color _buttonColor = Colors.deepPurpleAccent[400];
    final deviceSize = MediaQuery.of(context).size;
    bool isAuthResult = false;

    Future<bool> authenticateBiometrics() async {
      return isAuthResult =
          await Provider.of<AuthenticationProvider>(context, listen: false)
              .checkBiometric();
    }

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
                  TitleMain('SVI Time Clock'),
                  InputData('UserName', null),
                  InputPassword('Password'),
                  ButtonPlain('Log In', () {}),
                  DividerCustom('OR'),
                  ButtonColor(
                    'Log In with a Security Key',
                    () {},
                    _buttonColor,
                  ),
                  ButtonColor(
                    'Log In with Biometrics',
                    authenticateBiometrics,
                    _buttonColor,
                  ),
                  ButtonText(
                    'Forgot your Password?',
                    () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
