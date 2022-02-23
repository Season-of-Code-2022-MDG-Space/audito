import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/screens/home_page.dart';
import 'package:test/utils/routes.dart';
import 'package:test/utils/google_sign_in.dart';

class Login_page extends StatefulWidget {
  @override
  State<Login_page> createState() => Login_pageState();
}

class Login_pageState extends State<Login_page> {
  var name = "";
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "lib/Assets/Images/login.png",
              fit: BoxFit.cover,
              height: 500,
            ),
            Text(
              "Welcome $name!",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Username here",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Your Password here",
                      labelText: "Password",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final provider =Provider.of<GoogSignIn>(context, listen: false);
                      provider.googleLogin();
                      // Navigator.pushNamed(context, MyRoutes.home_route);
                    },
                    child: Text("Sign up with Google"),
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.orange  ,
                        primary: Colors.white,
                        minimumSize: Size(150, 40)),
                  ),
                ],
              ),
            ),
            Image.asset(
              "lib/Assets/Images/login.png",
              fit: BoxFit.cover,
              height: 500,
            ),
            Image.asset(
              "lib/Assets/Images/login.png",
              fit: BoxFit.cover,
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}
