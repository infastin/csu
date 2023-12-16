import 'package:flutter/material.dart';

class ErrorSnackBar {
  static SnackBar create({
    required String message,
    required ColorScheme colorScheme,
    required TextStyle textStyle,
  }) {
    return SnackBar(
      content: Text(
        message,
        style: textStyle.copyWith(
          color: colorScheme.onError,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: colorScheme.error,
      showCloseIcon: true,
      closeIconColor: colorScheme.onError,
    );
  }
}
