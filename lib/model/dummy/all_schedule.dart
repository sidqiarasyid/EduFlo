import 'package:edu_flo/model/dummy/schedule_perDay.dart';

class ScheduleAll {
  String day;
  List<ScheduleDay> schedule;
  bool expand;

  ScheduleAll({required this.day, required this.schedule, this.expand = false});
}
