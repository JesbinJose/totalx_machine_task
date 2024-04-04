import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneNumberAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';

  //SignInWithPhoneNumber or send otp function
  Future<bool> signInWithPhoneNumber(
    BuildContext context,
    String phoneNumber,
  ) async {
    bool isVerificationOK = false;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        _verificationId = verificationId;
        isVerificationOK = true;
        //handle Navigation here
      },
      codeAutoRetrievalTimeout: (String verificationId) async {
        await Future.delayed(
          const Duration(
            minutes: 2,
          ),
        );
      },
    );
    return isVerificationOK;
  }

  Future<String> verifyOTP({required String smsCode, required context}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      User? user = (await _auth.signInWithCredential(credential)).user;
      if (user != null) {
        return user.uid;
      }
    } on FirebaseAuthException catch (e) {
      //Show snakbar
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
