import 'dart:math';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

//This is the class for fingerprint Authentication

class LocalAuthApi {
  static final _auth = LocalAuthentication();
  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

 

  static Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
      
          localizedReason: "Scan FingerPrint to Aunthenticate",
          options:  AuthenticationOptions(
              stickyAuth: true,biometricOnly: true),
              
          );
    } on PlatformException catch (e) {
      return false;
    }
  }
}