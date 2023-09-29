import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:flutter/material.dart';

import '../themes/theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.errorText,
  });

  final String? labelText;
  final String? errorText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
        enabledBorder: kInputBorder(),
        focusedBorder: kInputBorder(),
        errorBorder: kInputBorder(),
        focusedErrorBorder: kInputBorder(),
      ),
    );
  }

  static UnderlineInputBorder kInputBorder(
          {Color borderColor = Colors.transparent}) =>
      UnderlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primary,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      );
}
