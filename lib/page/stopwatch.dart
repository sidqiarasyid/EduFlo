import 'dart:async';

import 'package:edu_flo/code_assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchPage extends StatefulWidget {
  final int hour;
  final int minute;
  const StopwatchPage({super.key, required this.hour, required this.minute});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Timer timer;
  int? valueTime;
  final player = AudioPlayer();
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
  );

  @override
  void initState() {
    player.setAsset("assets/sound/basic_bell.wav");
    _stopWatchTimer.setPresetHoursTime(widget.hour);
    _stopWatchTimer.setPresetMinuteTime(widget.minute);
    _stopWatchTimer.setPresetSecondTime(1);
    _stopWatchTimer.onStartTimer();
    timer = Timer.periodic(
        const Duration(milliseconds: 400), (timer) => updateStatus());
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    timer.cancel();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Study Mode",
              style: StyleText.appbarTitle(Colors.white.withOpacity(0.3))),
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                popupOut();
              },
              icon: AssetsIconImage.out_studymode),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Color(0xFF39C0FF),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.95, 1.0],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFF1CC8FF),
                          blurRadius: 7,
                          spreadRadius: 3,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: StreamBuilder<int>(
                      stream: _stopWatchTimer.rawTime,
                      initialData: 1,
                      builder: (context, snap) {
                        final value = snap.data;
                        valueTime = value;
                        final displayTime =
                            StopWatchTimer.getDisplayTime(value!);
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0),
                          child: Center(
                            child: Text(
                              displayTime,
                              style: GoogleFonts.inter(
                                  fontSize: 45,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SpaceWidget.height(context, 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    '"Your commitment to learning is the key that unlocks doors to a world of possibilities."',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> popupOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          content: Text(
            "Are you sure you want to quit study mode?",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.5))),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> popupFinish() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          content: Text(
            "Study Mode time is over",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              onPressed: () {
                player.stop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  updateStatus() {
    if (valueTime == 0) {
      player.play();
      player.setLoopMode(LoopMode.one);
      popupFinish();
      timer.cancel();
    }
  }
}
