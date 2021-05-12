import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LoginBiometricsScreen extends StatelessWidget {
  static const routeName = '/login-biometrics';

  void checkBiometric() async {
    final LocalAuthentication auth = LocalAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
