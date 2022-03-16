import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:test/screens/sign_in_screen.dart';
import 'package:test/utils/routes.dart';
import '/screens/YT_embed.dart';
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:provider/provider.dart';           // new
import '../Oauth/firebase_options.dart';                    // new
import 'package:test/utils/google_sign_in.dart';
import '/utils/sign_out.dart';
import '/screens/YT_embed.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
    var begin = Offset(-1.0, 0.0);
    var end = Offset.zero;
    var curve = Curves.ease;

    var tween =
    Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
    },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(),
                _user.photoURL != null
                    ? ClipOval(
                  child: Material(
                    color: Colors.grey,
                    child: Image.network(
                      _user.photoURL!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
                    : ClipOval(
                  child: Material(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Hello!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _user.displayName!,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '( ${_user.email!} )',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  'You are now signed in using your Google account. To sign out of your account, click the "Sign Out" button below.',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      letterSpacing: 0.2),
                ),
                SizedBox(height: 16.0),
                _isSigningOut
                    ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                    : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white ,
                      primary: Colors.red,
                    // shape: MaterialStateProperty.all(
                    //   RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    // ),
                  ),
                  onPressed: () async {
                    setState(() {
                      _isSigningOut = true;
                    });
                    await SignOut.signOut(context: context);
                    setState(() {
                      _isSigningOut = false;
                    });
                    Navigator.of(context)
                        .pushReplacement(_routeToSignInScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        // color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 315.0),
            ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.home_route);
                    },
                    child: Text("Play a Video!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.orange,
                        primary: Colors.white,
                        // minimumSize: Size(200, 50)
                       ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
