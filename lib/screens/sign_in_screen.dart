// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:test/screens/home_page.dart';
// import 'package:test/utils/routes.dart';
// import 'package:test/utils/google_sign_in.dart';
//
// class Login_page extends StatefulWidget {
//   @override
//   State<Login_page> createState() => Login_pageState();
// }
//
// class Login_pageState extends State<Login_page> {
//   var name = "";
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image.asset(
//               "lib/assets/Images/google_logo.png",
//               fit: BoxFit.cover,
//               height: 500,
//             ),
//             Text(
//               "Welcome $name!",
//               style: TextStyle(
//                 fontSize: 23,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                       hintText: "Enter Your Username here",
//                       labelText: "Username",
//                     ),
//                     onChanged: (value) {
//                       name = value;
//                       setState(() {});
//                     },
//                   ),
//                   TextFormField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: "Enter Your Password here",
//                       labelText: "Password",
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       final provider =Provider.of<GoogSignIn>(context, listen: false);
//                       provider.googleLogin();
//                       // Navigator.pushNamed(context, MyRoutes.home_route);
//                     },
//                     child: Text("Sign up with Google"),
//                     style: ElevatedButton.styleFrom(
//                         onPrimary: Colors.orange  ,
//                         primary: Colors.white,
//                         minimumSize: Size(150, 40)),
//                   ),
//                 ],
//               ),
//             ),
//             Image.asset(
//               "lib/assets/Images/google_logo.png",
//               fit: BoxFit.cover,
//               height: 500,
//             ),
//             Image.asset(
//               "lib/assets/Images/google_logo.png",
//               fit: BoxFit.cover,
//               height: 500,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 4.0,
            right: 4.0,
            bottom: 4.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //   Image.asset(
                    //     'assets/google_logo.png',
                    //     height: 4,
                    //     width: 4,
                    // ),
                    SizedBox(height: 4),
                    Text(
                      'Auito',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 40,
                        height: 8,
                      ),
                    ),
                    Text(
                      'Authentication',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 40,
                        height: 8,
                      ),
                    ),
                  ],
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}