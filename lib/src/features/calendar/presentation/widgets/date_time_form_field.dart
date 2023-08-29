import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum DatePickerType { date, time, dateTime }

class DateTimeFormField extends FormField<DateTime> {
  DateTimeFormField({
    super.key,
    DatePickerType type = DatePickerType.dateTime,
    super.validator,
    super.onSaved,
    this.onChanged,
    super.enabled,
    super.initialValue,
    DateTime? firstDate,
    DateTime? lastDate,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
    String Function(DateTime? dateTime, DatePickerType type)? dateBuilder,
  }) : super(builder: (fieldState) {
          final state = fieldState as _DateTimeFormState;

          final effectiveFirstDate = firstDate ?? DateTime(1900);
          final effectiveLastDate = lastDate ?? DateTime(2100);

          return GestureDetector(
            onTap: () async {
              DateTime? date;
              TimeOfDay? time;

              datePicker() => showDatePicker(
                    context: state.context,
                    initialDate: _getInitialDate(
                        state.value, effectiveFirstDate, effectiveLastDate),
                    firstDate: effectiveFirstDate,
                    lastDate: effectiveLastDate,
                  );

              timePicker() => showTimePicker(
                    context: state.context,
                    initialTime: _getInitialTime(state.value),
                  );

              if (type == DatePickerType.dateTime ||
                  type == DatePickerType.date) {
                date = await datePicker();
              }

              final isCancelledOnDatePick =
                  type == DatePickerType.dateTime && date == null;

              // there is no need to show timepicker if cancel was pressed on
              // datepicker`
              if ((type == DatePickerType.dateTime && !isCancelledOnDatePick) ||
                  type == DatePickerType.time) {
                time = await timePicker();
              }

              if (
                  // if `date` and `time` in `dateTime` mode is not empty...
                  (type == DatePickerType.dateTime &&
                          (date != null && time != null)) ||
                      // ... or if `date` in `date` mode is not empty ...
                      (type == DatePickerType.date && date != null) ||
                      // ... or if `time` in `time` mode is not empty ...
                      (type == DatePickerType.time && time != null)) {
                final dateTime = _combine(date, time);

                final value = state.value;
                // ... and new value is not the same as was before...
                if (value == null || dateTime.compareTo(value) != 0) {
                  // ... this means that cancel was not pressed at any moment
                  // so we can update the field
                  state.didChange(_combine(date, time));
                }
              }
            },
            child: InputDecorator(
              isEmpty: state.value == null,
              decoration: InputDecoration(
                errorText: state.errorText,
                hintText: _getHintText(type),
              ),
              child: Text(
                  dateBuilder?.call(state.value, type) ??
                      getFormattedText(state.value, type),
                  style: Theme.of(state.context).textTheme.bodyLarge),
            ),
          );
        });

  final ValueChanged<DateTime?>? onChanged;

  @override
  FormFieldState<DateTime> createState() => _DateTimeFormState();

  static DateTime _getInitialDate(
    DateTime? fieldValue,
    DateTime initialDate,
    DateTime lastDate,
  ) {
    if (fieldValue != null) {
      return fieldValue;
    }

    final now = DateTime.now();
    final dt = now.compareTo(lastDate) > 0 ? lastDate : now;
    return dt.compareTo(initialDate) > 0 ? dt : initialDate;
  }

  static TimeOfDay _getInitialTime(DateTime? fieldValue) {
    if (fieldValue != null) {
      return TimeOfDay(hour: fieldValue.hour, minute: fieldValue.minute);
    }
    return TimeOfDay.now();
  }

  static DateTime _combine(DateTime? date, TimeOfDay? time) {
    DateTime dateTime = DateTime(0);

    if (date != null) {
      dateTime = dateTime.add(date.difference(dateTime));
    }

    if (time != null) {
      dateTime = dateTime.add(Duration(hours: time.hour, minutes: time.minute));
    }

    return dateTime;
  }

  static String _getHintText(DatePickerType type) {
    switch (type) {
      case DatePickerType.date:
        return 'mm/dd/yyyy';
      case DatePickerType.time:
        return 'hh:mm';
      case DatePickerType.dateTime:
        return 'mm/dd/yyyy, hh:mm';
    }
  }

  static String getFormattedText(DateTime? value, DatePickerType type) {
    if (value == null) return '';
    switch (type) {
      case DatePickerType.date:
        return DateFormat.yMd().format(value);
      case DatePickerType.time:
        return DateFormat(DateFormat.HOUR_MINUTE).format(value);
      case DatePickerType.dateTime:
        return '${DateFormat.yMd().format(value)}, ${DateFormat(DateFormat.HOUR_MINUTE).format(value)}';
    }
  }
}

class _DateTimeFormState extends FormFieldState<DateTime> {
  @override
  void didChange(DateTime? value) {
    final formField = widget as DateTimeFormField;
    super.didChange(value);
    formField.onChanged?.call(value);
  }
}
