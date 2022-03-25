import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../screens/general/user_info_screen.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase(
      {required BuildContext context,}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              UserInfoScreen(
                user: user,
              ),
        ),
      );
    }
    return firebaseApp;
  }
}