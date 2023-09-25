import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/themes/app_styles.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    super.key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onYearSelectionTap,
    required this.calendarFormat,
    this.syncButton,
  });

  final DateTime focusedDay;
  final CalendarFormat calendarFormat;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onYearSelectionTap;
  final Widget? syncButton;

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMMM().format(focusedDay);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              onLeftArrowTap();
            },
            child: const Icon(
              Remix.arrow_left_s_line,
              size: 32,
            ),
          ),
          InkWell(
            onTap: () {
              onYearSelectionTap();
            },
            child: Text(
              headerText,
              style: AppStyles.text14PxBold.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onRightArrowTap();
            },
            child: const Icon(
              Remix.arrow_right_s_line,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
