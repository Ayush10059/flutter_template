import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../localization/l10n.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    super.key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onYearSelectionTap,
    required this.calendarFormat,
    this.syncButton,
  });

  final DateTime focusedDay;
  final CalendarFormat calendarFormat;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onYearSelectionTap;
  final Widget? syncButton;

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(focusedDay);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              onYearSelectionTap();
            },
            child: Row(
              children: [
                Text(
                  headerText,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                Icon(
                  Remix.arrow_drop_down_line,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                )
              ],
            ),
          ),
          Row(
            children: [
              if (syncButton != null) syncButton!,
              TextButton(
                onPressed: () {
                  onTodayButtonTap();
                },
                child: Text(l10n.today),
              ),
              GestureDetector(
                onTap: () {
                  onLeftArrowTap();
                },
                child: const Icon(
                  Remix.arrow_left_s_line,
                  size: 32,
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
          )
        ],
      ),
    );
  }
}
