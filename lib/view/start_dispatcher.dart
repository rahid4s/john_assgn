import 'package:flutter/material.dart';

import '../controller/app_controller.dart';
import 'homepage_screen.dart';
import 'signin_screen.dart';

class StartDispatcher extends StatelessWidget {
  const StartDispatcher({super.key});

  static const routeName = '/starDispatcher';

  @override
  Widget build(BuildContext context) {
    // read from shared preferences
    return currentUser == null ? const SignInScreen() : const HomePageScreen();
  }
}
