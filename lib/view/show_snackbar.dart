//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

void showSnackbar({
  required BuildContext context,
  required String message,
  int? seconds,
}) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: seconds ?? 3),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
