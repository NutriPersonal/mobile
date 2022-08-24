import 'package:flutter/material.dart';

class AppDialogs {
  static void snackbar(
    BuildContext context,
    String content, [
    String? actionLabel,
    VoidCallback? actionOnPressed,
  ]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.fixed,
        content: Text(content),
        action: actionLabel != null && actionOnPressed != null
            ? SnackBarAction(
                label: actionLabel,
                onPressed: actionOnPressed,
              )
            : null,
      ),
    );
  }
}
