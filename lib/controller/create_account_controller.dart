// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';

import '../view/create_account_screen.dart';
import '../view/show_snackbar.dart';
import 'app_controller.dart';

class CreateAccountController {
  CreateAccountState state;
  CreateAccountController(this.state);

  void showHidePasswords(bool? value) {
    if (value != null) {
      state.callSetState(() {
        state.model.showPasswords = value;
      });
    }
  }

  Future<void> createAccount() async {
    FormState? currentState = state.formKey.currentState;
    if (currentState == null) return;
    if (!currentState.validate()) return;

    currentState.save();
    if (state.model.password != state.model.passwordConfirm) {
      showSnackbar(
        context: state.context,
        message: 'Two passwords do not match',
        seconds: 20,
      );
      return;
    }

    state.callSetState(() => state.model.inProgress = true);
    try {
      //todo
    } catch (e) {
      print('====== failed to create: $e');
      if (state.mounted) {
        showSnackbar(
          context: state.context,
          message: 'failed to create: $e',
          seconds: 20,
        );
      }
    } finally {}
    state.callSetState(() => state.model.inProgress = false);
  }
}
