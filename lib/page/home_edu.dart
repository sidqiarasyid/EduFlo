import 'package:edu_flo/code_assets/assets.dart';
import 'package:edu_flo/page/schedule_all.dart';
import 'package:edu_flo/page/stopwatch.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeEduFlo extends StatefulWidget {
  const HomeEduFlo({super.key});

  @override
  State<HomeEduFlo> createState() => _HomeEduFloState();
}

class _HomeEduFloState extends State<HomeEduFlo> {
  TextEditingController hour = TextEditingController();
  TextEditingController minute = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
            title: Text("EduFLO", style: StyleText.appbarTitle(Colors.black)),
            centerTitle: true),
        body: Center(
          child: Column(
            children: [
              SpaceWidget.height(context, 0.05),
              GestureDetector(
                onTap: () {
                  showTimerSet();
                },
                child: AssetsIconImage.study_mode,
              ),
              SpaceWidget.height(context, 0.03),
              GestureDetector(
                onTap: () {},
                child: AssetsIconImage.grade_stat,
              ),
              SpaceWidget.height(context, 0.03),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScheduleAllPage()));
                },
                child: AssetsIconImage.sched_gen,
              ),
              SpaceWidget.height(context, 0.03),
              GestureDetector(
                onTap: () {},
                child: AssetsIconImage.style_find,
              ),
              Expanded(child: Container()),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showTimerSet() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFD0BCFF),
          title: Text(
            "Enter Study Mode time",
            style: StyleText.titlePopup(const Color(0xFF49454F)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        controller: hour,
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.inter(
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(":",
                        style: GoogleFonts.inter(
                            fontSize: 57,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF1D1B20))),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        controller: minute,
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.inter(
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SpaceWidget.height(context, 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hour",
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF49454F)),
                  ),
                  Text(
                    "Minute",
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF49454F)),
                  ),
                ],
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (hour.text.isEmpty && minute.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "the Hour and Minute fields cannot be empty");
                } else if (hour.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Hour fields cannot be empty");
                } else if (minute.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Minute fields cannot be empty");
                } else if (int.parse(hour.text) > 23 &&
                    int.parse(minute.text) > 59) {
                  Fluttertoast.showToast(
                      msg:
                          "Hours cannot be more than 23 and Minutes cannot be more than 59");
                } else if (int.parse(hour.text) > 23) {
                  Fluttertoast.showToast(msg: "Hours cannot be more than 23");
                } else if (int.parse(minute.text) > 59) {
                  Fluttertoast.showToast(msg: "Minutes cannot be more than 59");
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StopwatchPage(
                              hour: int.parse(hour.text),
                              minute: int.parse(minute.text))));
                }
              },
            ),
          ],
        );
      },
    );
  }
}
