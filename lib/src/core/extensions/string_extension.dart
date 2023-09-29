import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringX on String {
  bool get isEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  bool get isValidPhone =>
      RegExp(r'^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$')
          .hasMatch(this) &&
      this.length == 10;

  DateTime get parseDate => DateFormat('yyyy-MM-dd').parse(this);

  TimeOfDay get parsedTime =>
      TimeOfDay.fromDateTime(DateFormat('hh:mm a').parse(this));
}
