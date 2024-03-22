import 'package:flutter/material.dart';
import 'package:office_management/view/attendance_screen.dart';
import 'package:office_management/view/homepage_screen.dart';
import 'view/create_account_screen.dart';
import 'view/start_dispatcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FirebaseTemplateApp());
}

class FirebaseTemplateApp extends StatelessWidget {
  const FirebaseTemplateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      initialRoute: StartDispatcher.routeName,
      routes: {
        StartDispatcher.routeName: (context) => const StartDispatcher(),
        CreateAccountScreen.routeName: (context) => const CreateAccountScreen(),
        HomePageScreen.routeName: (context) => const HomePageScreen(),
        AttendanceScreen.routeName: (context) => const AttendanceScreen(),
      },
    );
  }
}
