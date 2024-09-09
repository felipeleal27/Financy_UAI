import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';

class CustomSnackBar {

  static void success(BuildContext context, {required String text, int duration = 2}) {
    IconSnackBar.show(
      context,
      snackBarType: SnackBarType.success,
      snackBarStyle: const SnackBarStyle( maxLines: 2),
      label: text,
      duration: Duration(seconds: duration),
    );
  }

  static void error(BuildContext context, {required String text, int duration = 2}) {
    IconSnackBar.show(
      context,
      snackBarType: SnackBarType.fail,
      snackBarStyle: const SnackBarStyle(maxLines: 2),
      label: text,
      duration: Duration(seconds: duration),

    );
  }

  static void info(BuildContext context, {required String text, int duration = 2}) {
    IconSnackBar.show(
      context,
      snackBarType: SnackBarType.alert,
      snackBarStyle: const SnackBarStyle(maxLines: 2),
      label: text,
      duration: Duration(seconds: duration),
    );
  }
}
