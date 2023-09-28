import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:flutter/material.dart';

import '../themes/theme.dart';
import '../widgets/widgets.dart';
import 'num_extension.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get size => MediaQuery.of(this).size;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  void showSnackbar({
    required String title,
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: SnackbarWidget(
            title: title,
            message: message,
            error: error,
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: 10.rounded,
          ),
          backgroundColor: error ? AppColors.statusRed : AppColors.statusGreen,
          padding: EdgeInsets.zero,
          elevation: 0,
          duration: const Duration(seconds: 3),
          margin: EdgeInsets.all(20.r),
        ),
      );
  }

  void showCustomDialog({
    required String title,
    required String description,
    required Widget content,
    Icon? icon,
  }) {
    showDialog(
      context: this,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: (icon != null)
              ? EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w)
              : EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) icon,
              Text(
                title,
                style: AppStyles.text18PxBold,
              ),
              Text(description),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
