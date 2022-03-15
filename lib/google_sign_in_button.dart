import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:test/screens/sign_in_screen.dart';
import 'package:test/utils/routes.dart';
import '/screens/YT_embed.dart';
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:provider/provider.dart';           // new
import '/firebase_options.dart';                    // new
import 'package:test/utils/google_sign_in.dart';
import '/screens/user_info_screen.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return _isSigningIn
        ? CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    )
        : OutlinedButton(
        onPressed: () async {
          setState(() {
            _isSigningIn = true;
          });
          User? user =
          await Authentication.signInWithGoogle(context: context);

          setState(() {
            _isSigningIn = false;
          });

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
        },
      child: SvgPicture.asset('images/sign_in.svg')
        // child: Text(
        //   'SIGN IN',
        //   style: TextStyle(
        //     fontFamily: "Lato",
        //     fontSize: 26,
        //     color: Colors.white,
        //     fontWeight: FontWeight.w600,
        //   ),
        );
  }
}