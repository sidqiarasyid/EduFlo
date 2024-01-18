import 'dart:async';

import 'package:edu_flo/code_assets/assets.dart';
import 'package:edu_flo/local/db_helper.dart';
import 'package:edu_flo/local/dummy/schedule_list.dart';
import 'package:edu_flo/model/db/login_db.dart';
import 'package:edu_flo/page/home_edu.dart';
import 'package:edu_flo/page/stopwatch.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  late List<Login> loginData;
  bool isLoad = false;
  DateTime now = DateTime.now();
  String day = DateFormat.EEEE().format(DateTime.now());
  String time = DateFormat.Hm().format(DateTime.now());
  String date = DateFormat.yMMMMd().format(DateTime.now());
  String scheduleText = "";
  late Timer timer;
  TextEditingController hour = TextEditingController();
  TextEditingController minute = TextEditingController();

  @override
  void initState() {
    getLogin();
    timer = Timer.periodic(
        const Duration(milliseconds: 500), (timer) => updateDateTime());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  updateDateTime() {
    setState(() {
      day = DateFormat.EEEE().format(DateTime.now());
      time = DateFormat.Hm().format(DateTime.now());
      date = DateFormat.yMMMMd().format(DateTime.now());
    });
  }

  Future getLogin() async {
    setState(() {
      isLoad = true;
    });
    loginData = await LoginDatabase.instance.readAll();
    setState(() {
      isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        key: key,
        appBar: appbarWidget(),
        drawer: drawerWidget(),
        body: Stack(
          children: [
            Column(
              children: [
                header(),
                content_schedule(),
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
            form_schedule(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appbarWidget() {
    return AppBar(
      title: Text("My List",
          style: StyleText.appbarTitle(const Color(0xFF39C0FF))),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              topSheet();
            },
            icon: AssetsIconImage.calendar)
      ],
      leading: IconButton(
          onPressed: () {
            key.currentState!.openDrawer();
          },
          icon: AssetsIconImage.dashboard),
    );
  }

  Widget drawerWidget() {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF39C0FF),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.3],
          ),
        ),
        child: isLoad
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(top: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AssetsIconImage.logo_app,
                            SpaceWidget.width(context, 0.03),
                            Text("EduFLO",
                                style: StyleText.appbarTitle(Colors.black)),
                          ],
                        ),
                        SpaceWidget.height(context, 0.02),
                        AssetsIconImage.avatar_user,
                        SpaceWidget.height(context, 0.02),
                        Text(loginData.last.username,
                            style: StyleText.appbarTitle(Colors.black)),
                        Text(loginData.last.email,
                            style: StyleText.email(Colors.black)),
                        SpaceWidget.height(context, 0.03),
                        const Divider(color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        margin: const EdgeInsets.only(top: 15),
        elevation: 5,
        color: const Color(0xFF39C0FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$day,", style: StyleText.appbarTitle(Colors.white)),
                  SpaceWidget.height(context, 0.01),
                  Text(time, style: StyleText.bigText(Colors.white)),
                  SpaceWidget.height(context, 0.01),
                  Text(date, style: StyleText.dateDay(Colors.white)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        showTimerSet();
                      },
                      child: Container(
                          width: 150,
                          height: 75,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/study_mode_little.png"),
                                fit: BoxFit.cover),
                          ))),
                  SpaceWidget.height(context, 0.01),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: 150,
                          height: 75,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/style_find_little.png"),
                                fit: BoxFit.cover),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget content_schedule() {
    return Expanded(
      child: ListView.builder(
        itemCount: schedule.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              margin: const EdgeInsets.only(top: 20),
              elevation: 3,
              child: ListTile(
                title: Text(schedule[index].title,
                    style: StyleText.titleListtile(Colors.black)),
                subtitle: Text(schedule[index].subtitle,
                    style: StyleText.subtitleListtile(Colors.black)),
                trailing: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFFD0BCFF)),
                ),
                isThreeLine: true,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget form_schedule() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(bottom: 40),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      blurRadius: 7,
                      spreadRadius: 3,
                      offset: const Offset(4, 8),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  onChanged: (String text) {
                    setState(() {
                      scheduleText = text;
                    });
                  },
                  decoration: InputDecoration(
                    hintStyle: StyleText.subtitle(const Color(0x80000000)),
                    hintText: "Add your schedule...",
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
            SpaceWidget.width(context, 0.05),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF1CC8FF),
                  textStyle: StyleText.button(null),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(500)))),
              onPressed: scheduleText != ""
                  ? () {}
                  : () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeEduFlo()));
                    },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: scheduleText != ""
                    ? const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white)
                    : AssetsIconImage.home,
              ),
            )
          ],
        ),
      ),
    );
  }

  topSheet() {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 500),
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.only(
                  top: 40, left: 12, right: 12, bottom: 8),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25))),
              child: SfDateRangePicker(
                selectionRadius: 50,
                allowViewNavigation: true,
                showNavigationArrow: true,
                showActionButtons: true,
                minDate: DateTime(2020, 01, 01),
                maxDate: DateTime(2045, 12, 31),
                enablePastDates: true,
                headerStyle: DateRangePickerHeaderStyle(
                    textStyle: StyleText.button(Colors.black)),
                monthViewSettings: DateRangePickerMonthViewSettings(
                  dayFormat: 'EEE',
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle: StyleText.weekDate(Colors.black)),
                  showTrailingAndLeadingDates: true,
                ),
                monthCellStyle: DateRangePickerMonthCellStyle(
                  textStyle: StyleText.calendar(Colors.black),
                  todayTextStyle: StyleText.calendar(Colors.black),
                  trailingDatesTextStyle:
                      StyleText.calendar(Colors.black.withOpacity(0.25)),
                  leadingDatesTextStyle:
                      StyleText.calendar(Colors.black.withOpacity(0.25)),
                ),
                selectionTextStyle: StyleText.calendar(Colors.black),
                selectionColor: const Color(0xFFD0BCFF),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(Tween<Offset>(
            begin: const Offset(0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
  }

  Future<void> showTimerSet() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
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
