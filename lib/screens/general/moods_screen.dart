import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test/models/mood_model.dart';
import 'package:test/screens/moods/burnt_out/burnt_out.dart';
class MoodsScreen extends StatefulWidget {
  const MoodsScreen({Key? key}) : super(key: key);

  @override
  _MoodsScreenState createState() => _MoodsScreenState();
}

class _MoodsScreenState extends State<MoodsScreen> {
  @override

  List<Moods> moods = [
    Moods("Bored",'bored or          \nconfused         ','./images/bored.png'),
    Moods("Proud",'proud          ','./images/proud.png'),
    Moods("Nostalgic",'nostalgic          ','./images/nostalgic.png'),
    Moods("Optimistic",'optimistic          ','./images/optimistic.png'),
    Moods("Relieved",'relieved          ','./images/relieved.png'),
    Moods("Excited",'excited          ','./images/excited.png'),
    Moods("Angry",'angry          ','./images/angry.png'),
    Moods("Demotivated",'demotivated          ','./images/demotivated.png'),
    Moods("Burnt-Out",'burnt-out          ','./images/burntout.png'),
    Moods("Stressed",'stressed or\nrelieved          ','./images/stressed.png'),
    Moods("Empty",'empty          ','./images/emptiness.png'),
  ];
  ScrollController _controller = ScrollController(initialScrollOffset: 380);
  double height_rect = 150, width_rect = 150;
  TextStyle label_options = TextStyle(fontFamily: 'Lato', fontSize: 22, color: Colors.white);

  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: _controller,
      scrollbarOrientation: ScrollbarOrientation.bottom,
      isAlwaysShown: true,
      minOverscrollLength: 60,
      crossAxisMargin: 20,
      mainAxisMargin: 124,
      minThumbLength: 60,
      thickness: 16,
      radius: Radius.circular(7.5),
      thumbColor: Color.fromRGBO(86,133,238,1),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Text(
                'which option best\n describes your current\n state of mind?',
                style: TextStyle(fontWeight:FontWeight.w700,fontFamily: 'Comfortaa', fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SingleChildScrollView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 510,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('./images/back.png'),
                        fit: BoxFit.cover
                    )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 5, 30),
                  child: Row(//8 Columns, 3 Rows
                    children: [
                      Column(//1
                        children: [
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(86,133,238,1)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),child: Image.asset(moods[0].img_url),onPressed: (){},),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(86,133,238,1)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),child: Image.asset(moods[1].img_url),onPressed: (){},),
                          ),
                        ],
                      ),
                      //the idea of looping through elements was dropped due to the variable column composition
                      Column(//2
                        children: [
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                child: Text(
                                  moods[0].label,
                                  style: label_options,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(86,133,238,1)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),child: Image.asset(moods[2].img_url),onPressed: (){},),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  moods[1].label,

                                  style: label_options,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(//3
                        children: [
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(86,133,238,1)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),child: Image.asset(moods[3].img_url),onPressed: (){},),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  moods[2].label,

                                  style: label_options,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(86,133,238,1)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),child: Image.asset(moods[4].img_url),onPressed: (){},),
                          ),
                        ],
                      ),
                      Column(//3
                        children: [
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  moods[3].label,

                                  style: label_options,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(86,133,238,1)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),child: Image.asset(moods[5].img_url),onPressed: (){},),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  moods[4].label,

                                  style: label_options,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(//5
                        children: [
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(86,133,238,1)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),child: Image.asset(moods[6].img_url),onPressed: (){},),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  moods[5].label,

                                  style: label_options,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(86,133,238,1)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),child: Image.asset(moods[7].img_url),onPressed: (){},),
                          ),
                        ],
                      ),
                      Column(//6
                        children: [
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  moods[6].label,

                                  style: label_options,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(86,133,238,1)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),child: Image.asset(moods[8].img_url),onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder:(_) => BurntOut())),),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  moods[7].label,

                                  style: label_options,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(//7
                        children: [
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(86,133,238,1)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),child: Image.asset(moods[9].img_url),onPressed: () {},),

                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  moods[8].label,
                                  style: label_options,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(86,133,238,1)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),child: Image.asset(moods[10].img_url),onPressed: (){},),

                          ),
                        ],
                      ),
                      Column(//8
                        children: [
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  moods[9].label,
                                  style: label_options,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                          ),
                          Container(
                            height: height_rect,
                            width: width_rect,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Center(
                                child: Text(
                                  moods[10].label,
                                  style: label_options,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox( height: 20,),
            SvgPicture.asset('images/scrolltrack.svg'),
            SizedBox( height: 20,),
          ],
        ),
      ),
    );}}
