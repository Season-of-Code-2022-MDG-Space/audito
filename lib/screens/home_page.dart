
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/screens/Login_page.dart';
import 'package:test/screens/YT_embed.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasError){
              return const Center(child: Text('An error has occurred'),);
            }
            else if(snapshot.hasData) {
              return YTembed();
            } else {
              return Login_page();
            }
          }
          return const CircularProgressIndicator();
        }
      ),
    );

}
