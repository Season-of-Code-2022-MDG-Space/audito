import 'package:flutter/material.dart';
import 'package:test/models/interest_model.dart';
import 'package:test/screens/general/moods_screen.dart';

import '../../utils/routes.dart';

class InterestSelection extends StatefulWidget {
  const InterestSelection({Key? key}) : super(key: key);

  @override
  _InterestSelectionState createState() => _InterestSelectionState();
}

class _InterestSelectionState extends State<InterestSelection> {
  @override
  List<Interest> interest = [
    Interest("Football", false),
    Interest("Cricket", false),
    Interest("Science", false),
    Interest("Tech", false),
    Interest("Movies", false),
    Interest("Music", false),
    Interest("Food", false),
    Interest("Psychology", false),
    Interest("Photography", false),
    Interest("Gaming", false),
    Interest("Book Reading", false),
    Interest("Coding", false),
    Interest("Youtube Entertainment", false),
  ];

  List<Interest> selectedinterest = [];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        child: Text("SAVE"),
        onPressed: () => Navigator.pushNamed(context, MyRoutes.Moods_Screen),
      ),
        appBar: AppBar(
          title: Text("Select Your Interest"),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: SafeArea(
          child: Scrollbar(
            child: Container(

              child: ListView.builder(
                  itemCount: interest.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InterestItem(
                        interest[index].title, interest[index].isSelected, index);
                  }),
            ),
          ),

        ));
  }

  Widget InterestItem(String title, bool isSelected, int index) {
    return ListTile(

        leading: CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(
            Icons.arrow_right,
            color: Colors.pink,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: isSelected
            ? Icon(Icons.check_circle, color: Colors.pink)
            : Icon(Icons.check_circle_outlined, color: Colors.yellow),
        onTap: () {
          setState(
            () {
              interest[index].isSelected = !interest[index].isSelected;
              if (interest[index].isSelected == true) {
                selectedinterest.add(Interest(interest[index].title, true));
              } else if (interest[index].isSelected == false) {
                selectedinterest.removeWhere(
                    (element) => element.title == interest[index].title);
              }
              ;
            },
          );
        });
  }
}
