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
import '/authentication.dart';
import '/google_sign_in_button.dart';


class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color : Color.fromRGBO(223, 223, 223, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 5,
            ),
            Text("auito", textAlign: TextAlign.center, style: TextStyle(fontSize: 24,color: Colors.black, fontFamily: 'Comfortaa'), ),
            ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(height:250, width:250,child: new Image.asset('./images/Image7.png'))),
            Text("Lorem ipsum dolor sit \n amet, khinsectetur \n Manchester elit. Lacinia.", textAlign: TextAlign.center, style: TextStyle(fontSize: 28,color: Color.fromRGBO(0x4A,0x72,0xCC,100), fontFamily:'Cabin'), ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return GoogleSignInButton();
                }
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.amber,
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            SvgPicture.asset('images/LoadBar3of3.svg')
          ],
        ),
      ),
    );
  }
}