import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/utils/routes.dart';

  class SecondIntroPage extends StatelessWidget {
  const SecondIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text("AUITO", textAlign: TextAlign.center, style: TextStyle(fontSize: 30,color: Colors.black,
          ), ),
          SizedBox(
            height: 10,
          ),

          Image.network("https://th.bing.com/th/id/OIP.ko1zOSkwYWADb0qY19an0wHaFj?pid=ImgDet&rs=1", height: 370, width: 370,),
          SizedBox(
            height: 20,

          ),
          Text("Some Text", textAlign: TextAlign.center, style: TextStyle(fontSize: 30,color: Colors.black), ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, MyRoutes.login_route);

          }, child: Text("NEXT", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}
