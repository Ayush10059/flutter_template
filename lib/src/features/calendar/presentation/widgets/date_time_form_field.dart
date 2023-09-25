import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeFormField extends FormField<DateTime> {
  DateTimeFormField({
    super.key,
    super.validator,
    super.onSaved,
    this.onChanged,
    super.enabled,
    super.initialValue,
    DateTime? firstDate,
    DateTime? lastDate,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
    String Function(DateTime? dateTime)? dateBuilder,
  }) : super(builder: (fieldState) {
          final state = fieldState as _DateTimeFormState;

          return GestureDetector(
            onTap: () async {
              TimeOfDay? time = await showTimePicker(
                context: state.context,
                initialTime: _getInitialTime(state.value),
              );

              if (time != null) {
                var value = state.value;
                state.didChange(value);
              }
            },
            child: InputDecorator(
              isEmpty: state.value == null,
              decoration: InputDecoration(
                errorText: state.errorText,
                hintText: _getHintText(),
              ),
              child: Text(
                  dateBuilder?.call(state.value) ??
                      _getFormattedText(state.value),
                  style: Theme.of(state.context).textTheme.bodyLarge),
            ),
          );
        });

  final ValueChanged<DateTime?>? onChanged;

  @override
  FormFieldState<DateTime> createState() => _DateTimeFormState();

  static TimeOfDay _getInitialTime(DateTime? fieldValue) {
    if (fieldValue != null) {
      return TimeOfDay(hour: fieldValue.hour, minute: fieldValue.minute);
    }
    return TimeOfDay.now();
  }

  static String _getHintText() {
    return 'hh:mm';
  }

  static String _getFormattedText(DateTime? value) {
    if (value == null) return '';
    return DateFormat(DateFormat.HOUR_MINUTE).format(value);
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
