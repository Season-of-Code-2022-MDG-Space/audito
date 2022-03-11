import 'package:flutter/material.dart';
// import 'package:test/screens/sign_in_screen.dart';
// import 'package:test/utils/routes.dart';
// import 'screens/YT_embed.dart';
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new
// import 'package:provider/provider.dart';           // new
// import 'firebase_options.dart';                    // new
// import 'package:test/utils/google_sign_in.dart';
import '/screens/user_info_screen.dart';

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