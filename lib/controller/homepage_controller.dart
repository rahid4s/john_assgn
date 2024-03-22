// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';

import '../view/attendance_screen.dart';
import '../view/create_account_screen.dart';
import '../view/homepage_screen.dart';
import '../view/show_snackbar.dart';
import 'app_controller.dart';

class HomepageController {
  HomePageState state;
  HomepageController(this.state);

  void goToAttendance() {
    Navigator.pushNamed(state.context, AttendanceScreen.routeName);
  }
}
