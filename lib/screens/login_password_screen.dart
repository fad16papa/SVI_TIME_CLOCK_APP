import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
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
    bool isAuth = false;

    void checkBiometric() async {
      final LocalAuthentication auth = LocalAuthentication();
      bool canCheckBiometrics = false;
      try {
        canCheckBiometrics = await auth.canCheckBiometrics;
      } catch (e) {
        print("error biome trics $e");
      }
      print("biometric is available: $canCheckBiometrics");
      List<BiometricType> availableBiometrics;
      try {
        availableBiometrics = await auth.getAvailableBiometrics();
      } catch (e) {
        print("error enumerate biometrics $e");
      }
      if (Platform.isIOS) {
        if (availableBiometrics.contains(BiometricType.face)) {
          // Face ID.
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          // Touch ID.
        }
      }
      print("following biometrics are available");
      if (availableBiometrics.isNotEmpty) {
        availableBiometrics.forEach((ab) {
          print("\ttech: $ab");
        });
      } else {
        print("no biometrics are available");
      }

      bool authenticated = false;

      try {
        authenticated = await auth.authenticate(
          biometricOnly: true,
          localizedReason: 'Confirm login with your biometrics',
          useErrorDialogs: true,
          stickyAuth: false,
          androidAuthStrings:
              (AndroidAuthMessages(signInTitle: 'Log in using biometrics')),
          // androidAuthStrings:AndroidAuthMessages(signInTitle: "Login to HomePage")
        );
      } catch (e) {
        print("error using biometric auth: $e");
      }

      setState(() {
        isAuth = authenticated ? true : false;
      });

      print("authenticated: $authenticated");
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
                    checkBiometric,
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
