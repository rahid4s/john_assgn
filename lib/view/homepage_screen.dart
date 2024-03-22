import 'package:flutter/material.dart';
import 'package:office_management/controller/app_controller.dart';
import 'package:office_management/controller/homepage_controller.dart';
import 'package:office_management/model/homepage_model.dart';
import 'package:office_management/model/user_model.dart';

import '../controller/create_account_controller.dart';
import '../model/create_account_model.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  static const routeName = '/homepageScreen';

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePageScreen> {
  late HomePageModel model;
  late HomepageController con;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    model = HomePageModel();
    con = HomepageController(this);
  }

  void callSetState(fn) => setState(fn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new account'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text(currentUser!.username!),
          FilledButton.tonal(
            onPressed: con.goToAttendance,
            child: const Text('Attendance'),
          ),
        ],
      )),
    );
  }
}
