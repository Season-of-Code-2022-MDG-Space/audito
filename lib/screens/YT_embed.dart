import 'package:flutter/material.dart';
import 'package:test/screens/Login_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' show YoutubePlayer, YoutubePlayerBuilder, YoutubePlayerController, YoutubePlayerFlags;

class YTembed extends StatefulWidget {
  @override
  State<YTembed> createState() => _YTembedState();
}

class _YTembedState extends State<YTembed> {

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'dhYOPzcsbGM',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      controlsVisibleAtStart: false,
      loop: true,
    ),
  );

//https://youtu.be/dhYOPzcsbGM

  @override
  Widget build(BuildContext context) {
    String url;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "!!Youtube Player!!",
              textAlign: TextAlign.center,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children:[
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,

                ),

                SizedBox(height: 40.0),
               Text(
                "Test Player",
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     hintText: "url of the video",
                //     labelText: "URL",
                //   ),
                //   onChanged: (value) {
                //     url = value;
                //   },
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     setState(() {
                //     });
                //   },
                //   child: Text("Play"),
                //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                // ),
            ]
            ),
          ),
          drawer: Drawer(),
        );
  }
}

