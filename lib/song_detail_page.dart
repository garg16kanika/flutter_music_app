import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_music_app/audio_model.dart';

class SongDetailPage extends StatefulWidget {
  final int index;
  const SongDetailPage({super.key, required this.index});

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  final player = AudioPlayer();
  bool isPlaying = false;
  double value = 0;

  Duration? duration = Duration(seconds: 0);

  void initPlayer() async {
    await player.setSource(AssetSource(
      songs[this.widget.index].audioPath,
    ));
    duration = await player.getDuration();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  songs[this.widget.index].imageURL,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  songs[this.widget.index].imageURL,
                  width: 250.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                songs[this.widget.index].title,
                style: TextStyle(
                    color: Colors.white, fontSize: 36, letterSpacing: 6),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${(value / 60).floor()}: ${(value % 60).floor()}",
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    width: 260.0,
                    child: Slider.adaptive(
                      onChangeEnd: (new_value) async {
                        setState(() {
                          value = new_value;
                          print(new_value);
                        });
                        player.pause();
                        await player.seek(Duration(seconds: new_value.toInt()));
                        await player.resume();
                      },
                      min: 0.0,
                      value: value,
                      max: 214.0,
                      onChanged: (v) {
                        //value = v;
                      },
                      activeColor: Colors.white,
                    ),
                  ),
                  Text(
                    "${duration!.inMinutes} : ${duration!.inSeconds % 60}",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                ],
              ),
              IconButton(
                onPressed: () async {
                  if (isPlaying) {
                    await player.pause();
                    setState(() {
                      isPlaying = false;
                    });
                  } else {
                    await player.resume();
                    setState(() {
                      isPlaying = true;
                    });

                    player.onPositionChanged.listen((event) {
                      setState(() {
                        value = event.inSeconds.toDouble();
                      });
                    });
                  }
                },
                icon: Icon(
                  isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.height * 0.08,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
