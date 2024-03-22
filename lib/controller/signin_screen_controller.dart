// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:office_management/view/homepage_screen.dart';

import '../model/user_model.dart';
import '../view/create_account_screen.dart';
import '../view/show_snackbar.dart';
import '../view/signin_screen.dart';
import 'app_controller.dart';

class SignInScreenController {
  SignInState state;
  SignInScreenController(this.state);

  Future<void> signIn() async {
    FormState? currentState = state.formKey.currentState;
    if (currentState == null) return;
    if (!currentState.validate()) return;
    currentState.save();

    try {
      Map<String, dynamic> response = await login(
        email: state.model.email!,
        password: state.model.password!,
      );

      // user data
      currentUser = UserModel(
          id: response['data']['id'],
          email: response['data']['email'],
          token: response['data']['token'],
          designation: response['data']['designation'],
          username: response['data']['username']);

      Navigator.pushReplacementNamed(state.context, HomePageScreen.routeName);
    } catch (e) {
      print('=== sign in error: $e');
      showSnackbar(
        context: state.context,
        message: 'sign in error: $e',
        seconds: 10,
      );
    }
  }

  void gotoCreateAccount() {
    Navigator.pushNamed(state.context, CreateAccountScreen.routeName);
  }
}
