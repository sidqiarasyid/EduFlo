import 'package:edu_flo/code_assets/assets.dart';
import 'package:edu_flo/local/dummy/schedule.dart';
import 'package:edu_flo/local/dummy/schedule_all.dart';
import 'package:edu_flo/model/dummy/all_schedule.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleAllPage extends StatefulWidget {
  const ScheduleAllPage({super.key});

  @override
  State<ScheduleAllPage> createState() => _ScheduleAllPageState();
}

class _ScheduleAllPageState extends State<ScheduleAllPage> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Schedule", style: StyleText.appbarTitle(Colors.black)),
            centerTitle: true),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (int index, bool expand) {
              setState(() {
                allSchedule[index].expand = !(allSchedule[index].expand);
              });
            },
            children: allSchedule.map<ExpansionPanel>((ScheduleAll step) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(step.day),
                  );
                },
                body: ListView.builder(
                  shrinkWrap: true,
                  itemCount: one_week.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(one_week[index].activity);
                  },
                ),
                isExpanded: step.expand,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
