import 'package:flutter/material.dart';

import '../models/mood_model.dart';
class MoodsScreen extends StatefulWidget {
  const MoodsScreen({Key? key}) : super(key: key);

  @override
  _MoodsScreenState createState() => _MoodsScreenState();
}

class _MoodsScreenState extends State<MoodsScreen> {
  List<Moods> moods = [
    Moods("Burnt Out",""),
    Moods("Demotivated",""),
    Moods("Emptiness", ""),
    Moods("Excited", ""),
    Moods("Nostalgic", ""),
    Moods("Optimistic", ""),
    Moods("Proud", ""),
    Moods("Relieved", ""),
    Moods("Stressed", ""),
    Moods("Angry", ""),
    Moods("Confused", ""),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("How are you feeling?"),
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.white,
        centerTitle: true,

      ),
      body:SafeArea(
    child: Scrollbar(
    child: Container(

        child: ListView.builder(
        itemCount: moods.length,
        itemBuilder: (BuildContext context, int index) {
          return MoodItem(
              moods[index].title, moods[index].img_url, index);
        }),
    ),
    ),

    )
    );
  }
}
Widget MoodItem(String title, String img_url, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: RaisedButton(
      child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.white, ),
          ),
          autofocus: true,
          tileColor: Colors.orangeAccent,
        ),
      onPressed: (){},
    ),
  );
}
