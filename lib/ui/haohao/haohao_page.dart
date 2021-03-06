import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HaoHaoPage extends StatefulWidget {
  @override
  _HaoHaoPageState createState() => _HaoHaoPageState();
}

class _HaoHaoPageState extends State<HaoHaoPage> {
  VideoPlayerController player;
  ChewieController chewieController;

  @override
  void initState() {
    player = VideoPlayerController.network(
        'https://d1.urlgot.top/files/1587003766814031023.mp4?n=黑人抬棺原版视频_.mp4&t=c356d4d4a7f1c2f11fb95598cd950da8');
    chewieController = ChewieController(
      videoPlayerController: player,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: true,
    );
//    timer = Timer.periodic(Duration(seconds: 5), (t) {
//      chewieController.play();
//    });

    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(child: Chewie(controller: chewieController)),
          AnimatedText(),
        ],
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  Timer timer;
  Color color = Colors.greenAccent;

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        if (color == Colors.greenAccent) {
          color = Colors.redAccent;
        } else {
          color = Colors.greenAccent;
        }
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
        child: Container(alignment: Alignment.center, child: Text('浩浩哥哥我爱你', style: TextStyle(color: color, fontSize: 40))));
  }
}
