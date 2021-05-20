import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svi_time_clock_app/providers/authentication_provider.dart';
import 'package:svi_time_clock_app/widgets/button_color.dart';
import 'package:svi_time_clock_app/widgets/button_plain.dart';
import 'package:svi_time_clock_app/widgets/button_text.dart';
import 'package:svi_time_clock_app/widgets/divider_custom.dart';
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
    final _userNameController = TextEditingController();
    final Color _buttonColor = Colors.deepPurpleAccent[400];
    final deviceSize = MediaQuery.of(context).size;
    bool isAuthResult = false;

    Future<bool> authenticateBiometrics(String userName) async {
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
                    () {},
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
