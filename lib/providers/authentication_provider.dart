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

  //This will call the preauthenticate api to get the challange token from FIDO2
  Future<PreAuthenticateResponseModel> preAuthenticated(String userName) async {
    try {
      var requestBody = new PreAuthenticateModel(
        svcinfo: Svcinfo(
            did: 1,
            protocol: 'FIDO2_0',
            authtype: 'PASSWORD',
            svcusername: 'svcfidouser',
            svcpassword: 'Abcd1234!'),
        payload: Payload(
          username: userName,
          options: '{}',
        ),
      );

      final response = await http.post(
        Uri.parse(fidoUrl + '/preauthenticate'),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      final responseData = json.decode(response.body);
      print(responseData);
      if (response.reasonPhrase != 'OK') {
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

  //This will call the authenticate api to verify the challenge token from FIDO2
  Future<String> authenticated() async {
    try {
      final response = await http.post(
        Uri.parse(fidoUrl + '/authenticate'),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode('test'),
      );

      final responseData = json.decode(response.body);
      print(responseData);
      if (response.reasonPhrase != 'OK') {
        throw HttpException(responseData['code']);
      }

      return responseData.toString();
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
    } catch (e) {
      print("error using biometric auth: $e");
    }

    return isAuth = authenticated ? true : false;
  }
}
