import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  User currentUser;

  Future<void> phoneVerfication(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credintial) async {
        auth.signInWithCredential(credintial);
        currentUser = auth.currentUser;
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('Thr Provided Phone Number is invalid');
        }
      },
      codeSent: (String verficationID, int resednToken) async {
        String smsCode = 'xxxx';

        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verficationID, smsCode: smsCode);

        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  Future<void> signInWithGoogle () async {
  }

  Future<User> signInAnnon () async {
    UserCredential credential = await auth.signInAnonymously();
    currentUser = credential.user;
    return currentUser;
  }

}
