import 'package:local_auth/local_auth.dart';

class FingerPrintComponent {

final LocalAuthentication _auth = LocalAuthentication();

// Future<bool>hasEnrolledBiometics()async {
// final List<BiometricType>availabeBiometircs = await _auth.getAvailableBiometrics();

// if(availabeBiometircs.isNotEmpty) {
//   return true;
// }
// return false;

// }

Future<bool>authenticate()async {
  final bool didAuthenticate = await _auth.authenticate(
    
    localizedReason: 'Please Authenticate to Proceed',
    options: const AuthenticationOptions(biometricOnly: true) 
    
    
    
    
    
    );

    return didAuthenticate;
}


}