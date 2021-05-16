import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:svi_time_clock_app/models/preauthenticate_model.dart';
import 'package:svi_time_clock_app/models/preauthenticate_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthenticationProvider with ChangeNotifier {
  bool isAuth = false;

  String fidoUrl = env['FIDO_URL'];

  Future<PreAuthenticateResponseModel> preAuthenticated() async {
    var client = http.Client();
    try {
      final response = await client.post(
        Uri.parse(fidoUrl + '/preauthenticate'),
        body: json.encode(
          PreAuthenticateModel(
            svcinfo: Svcinfo(
                did: 1,
                protocol: 'FIDO2_0',
                authtype: 'PASSWORD',
                svcusername: 'svcfidouser',
                svcpassword: 'Abcd1234!'),
            payload: Payload(username: 'johndoe', options: 'direct'),
          ),
        ),
      );

      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['code'] != 200) {
        throw HttpException(responseData['code']);
      }
      return PreAuthenticateResponseModel(
        response: Response(
          challenge: responseData['challenge'],
          allowCredentials: responseData['allowCredentials'],
        ),
      );
    } catch (error) {
      throw error;
    }
  }

  Future<bool> checkBiometric() async {
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

      PreAuthenticateResponseModel responseModel = await preAuthenticated();
    } catch (e) {
      print("error using biometric auth: $e");
    }
    print("authenticated: $authenticated");

    return isAuth = authenticated ? true : false;
  }
}
