import 'package:flutter/material.dart';

class LabeledWidget extends StatelessWidget {
  const LabeledWidget({super.key, this.labelText, required this.child});
  final String? labelText;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(labelText!),
          const SizedBox(height: 4),
        ],
        child
      ],
    );
  }
}
