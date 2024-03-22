// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:office_management/controller/app_controller.dart';
import 'package:office_management/model/attendance_model.dart';

import '../view/attendance_screen.dart';
import '../view/show_snackbar.dart';

class AttendanceController {
  AttendanceState state;
  AttendanceController(this.state);

  List<AttendanceModel> timeList = [];

  List<AttendanceModel> dummyTimeList = [
    AttendanceModel(
        date: '2024-03-01', entryTime: '09:00 AM', exitTime: '06:00 PM'),
    AttendanceModel(
        date: '2024-03-02', entryTime: '08:30 AM', exitTime: '05:30 PM'),
    AttendanceModel(
        date: '2024-03-03', entryTime: '09:15 AM', exitTime: '06:15 PM'),
    AttendanceModel(
        date: '2024-03-04', entryTime: '09:30 AM', exitTime: '06:30 PM'),
    AttendanceModel(
        date: '2024-03-05', entryTime: '09:45 AM', exitTime: '06:45 PM'),
    AttendanceModel(
        date: '2024-03-06', entryTime: '09:00 AM', exitTime: '06:00 PM'),
    AttendanceModel(
        date: '2024-03-07', entryTime: '08:45 AM', exitTime: '05:45 PM'),
    AttendanceModel(
        date: '2024-03-08', entryTime: '09:20 AM', exitTime: '06:20 PM'),
    AttendanceModel(
        date: '2024-03-09', entryTime: '09:10 AM', exitTime: '06:10 PM'),
    AttendanceModel(
        date: '2024-03-10', entryTime: '08:55 AM', exitTime: '05:55 PM'),
  ];

  Future getTimeList() async {
    try {
      Map<String, dynamic> response = await getAttendanceList();
      print(response);
      for (var i = 0; i < response['data'].length; i++) {
        AttendanceModel m = AttendanceModel(
          date: response['data'][i]['date'],
          entryTime: response['data'][i]['entry_time'],
          exitTime: response['data'][i]['exit_time'],
        );
        timeList.add(m);
      }
      state.callSetState(() {});
    } catch (e) {
      print('=== getTimeList error: $e');
      showSnackbar(
        context: state.context,
        message: 'error: $e',
        seconds: 10,
      );
    }
  }
}
