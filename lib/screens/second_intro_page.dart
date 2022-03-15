import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/utils/routes.dart';
import 'sign_in_screen.dart';

  class SecondIntroPage extends StatelessWidget {
  const SecondIntroPage({Key? key}) : super(key: key);

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
                child: Container(height:250, width:250,child: new Image.asset('./images/Image6.png'))),
            Text("Lorem ipsum dolor sit \n amet, consectetur \n adipiscing elit. Lacinia.", textAlign: TextAlign.center, style: TextStyle(fontSize: 28,color: Color.fromRGBO(0x4A,0x72,0xCC,100), fontFamily:'Cabin'), ),
            SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: ElevatedButton(onPressed: () {Navigator.push(
                context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
                      transitionDuration: Duration(milliseconds: 400),
                  )
              );},
                  child:Text("NEXT", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: 'Lato',fontSize:26,fontWeight: FontWeight.w600)),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Color.fromRGBO(196, 196, 196, 1),
                      minimumSize: Size(130,50)
                  )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SvgPicture.asset('images/LoadBar2of3.svg')
          ],
        ),
      ),
    );
  }
}
