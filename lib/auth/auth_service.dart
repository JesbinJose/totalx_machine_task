import 'package:firebase_auth/firebase_auth.dart';

class PhoneNumberAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';
  String _phoneNumber = '';

  // Sign in with phone number and send OTP
  Future<bool> signInWithPhoneNumber(String phoneNumber) async {
    bool isVerificationSent = false;
    _phoneNumber = phoneNumber;
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          //handle exception
        },
        codeSent: (String verificationId, int? resendToken) async {
          _verificationId = verificationId;
          isVerificationSent = true;
          // Handle navigation here (optional)
        },
        codeAutoRetrievalTimeout: (String verificationId) async {
          await Future.delayed(const Duration(minutes: 2));
        },
      );
    } catch (e) {
      //handle exception
    }
    return isVerificationSent;
  }

  // Resend OTP function
  Future<void> resendOTP() async {
    if (_verificationId.isEmpty) {
      //handle empty case
      return;
    }

    try {
      signInWithPhoneNumber(_phoneNumber);
    } catch (e) {
      print('Error during OTP resend: $e'); // Log for debugging
    }
  }

  // Verify OTP
  Future<String> verifyOTP({required String smsCode, required}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      User? user = (await _auth.signInWithCredential(credential)).user;
      if (user != null) {
        return user.uid;
      }
    } on FirebaseAuthException catch (_) {
      //handle  exception here and show appropriate message to the user
    }
    return '';
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
