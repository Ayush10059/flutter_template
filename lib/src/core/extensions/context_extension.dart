import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../localization/l10n.dart';
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

  void showAlertDialog({
    required VoidCallback onConfirm,
    String? content,
    String? title,
  }) {
    showDialog(
      context: this,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title ?? l10n.areYouSure),
        content: Text(content ?? l10n.youCannotUndoThisAction),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  context.router.pop();
                },
                child: Text(
                  l10n.cancel,
                  style: Theme.of(this)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(this).colorScheme.primary),
                ),
              ),
              TextButton(
                onPressed: onConfirm,
                child: Text(
                  l10n.confirm,
                  style: Theme.of(this)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(this).colorScheme.primary),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void showCustomDialog({
    void Function(BuildContext context)? onClose,
    void Function(BuildContext context)? onActionConfirm,
    required Widget content,
    required String title,
    required String actionTitle,
    bool barrierDismissle = false,
  }) {
    showDialog(
      context: this,
      barrierDismissible: barrierDismissle,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (onClose == null) {
                        context.popRoute();
                      } else {
                        onClose.call(context);
                      }
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              content,
              18.verticalSpace,
              if (onActionConfirm != null)
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        label: actionTitle,
                        onPressed: () => onActionConfirm(context),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
