import 'dart:io';

import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class AuthenticationProvider {
  bool isAuth = false;
  Future<void> checkBiometric() async {
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
        sensitiveTransaction: true,
        androidAuthStrings:
            (AndroidAuthMessages(signInTitle: 'Log in using biometrics')),
        // androidAuthStrings:AndroidAuthMessages(signInTitle: "Login to HomePage")
      );
    } catch (e) {
      print("error using biometric auth: $e");
    }

    // setState(() {
    //   isAuth = authenticated ? true : false;
    // });

    print("authenticated: $authenticated");
  }
}
