import 'package:flutter/material.dart';
import 'package:office_management/controller/app_controller.dart';
import 'package:office_management/controller/attendance_controller.dart';
import 'package:office_management/controller/homepage_controller.dart';
import 'package:office_management/model/attendance_model.dart';
import 'package:office_management/model/homepage_model.dart';
import 'package:office_management/model/user_model.dart';

import '../controller/create_account_controller.dart';
import '../model/create_account_model.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  static const routeName = '/attendanceScreen';

  @override
  State<StatefulWidget> createState() {
    return AttendanceState();
  }
}

class AttendanceState extends State<AttendanceScreen> {
  late AttendanceModel model;
  late AttendanceController con;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    model = AttendanceModel();
    con = AttendanceController(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => con.getTimeList());
  }

  void callSetState(fn) => setState(fn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATTENDANCE'),
      ),
      body: con.timeList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: con.timeList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(con.timeList[index].date!),
                    subtitle: Text(
                        'Entry Time: ${con.timeList[index].entryTime} Exit Time: ${con.timeList[index].exitTime}'),
                  ),
                );
              }),
    );
  }
}
