// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Splash Page`
  String get splashPageTitle {
    return Intl.message(
      'Splash Page',
      name: 'splashPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email Address`
  String get emailHint {
    return Intl.message(
      'Enter Email Address',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get passwordHint {
    return Intl.message(
      'Enter Password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message(
      'Email Address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Server Error`
  String get serverError {
    return Intl.message(
      'Server Error',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternet {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `UnAuthorized Access`
  String get unAuthorizedAccess {
    return Intl.message(
      'UnAuthorized Access',
      name: 'unAuthorizedAccess',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Calendar sync successful`
  String get calendarSyncSuccessful {
    return Intl.message(
      'Calendar sync successful',
      name: 'calendarSyncSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Error`
  String get unexpectedError {
    return Intl.message(
      'Unexpected Error',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Connection failed. Please check you have working internet connection.`
  String get networkExceptionConnection {
    return Intl.message(
      'Connection failed. Please check you have working internet connection.',
      name: 'networkExceptionConnection',
      desc: '',
      args: [],
    );
  }

  /// `It took to long to complete the request please try again.`
  String get networkExceptionTimeout {
    return Intl.message(
      'It took to long to complete the request please try again.',
      name: 'networkExceptionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong while connecting to server.`
  String get networkExceptionUnexpected {
    return Intl.message(
      'Something went wrong while connecting to server.',
      name: 'networkExceptionUnexpected',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get xceptionUnexpected {
    return Intl.message(
      'Something went wrong.',
      name: 'xceptionUnexpected',
      desc: '',
      args: [],
    );
  }

  /// `Unsupported platform`
  String get xceptionUnsupportedPlatform {
    return Intl.message(
      'Unsupported platform',
      name: 'xceptionUnsupportedPlatform',
      desc: '',
      args: [],
    );
  }

  /// `No permission to access calendar.`
  String get xceptionCalendarNoPermission {
    return Intl.message(
      'No permission to access calendar.',
      name: 'xceptionCalendarNoPermission',
      desc: '',
      args: [],
    );
  }

  /// `Unable to retrieve calendars.`
  String get xceptionCalendarRetrieve {
    return Intl.message(
      'Unable to retrieve calendars.',
      name: 'xceptionCalendarRetrieve',
      desc: '',
      args: [],
    );
  }

  /// `Unable to add event.`
  String get xceptionCalendarEventAdd {
    return Intl.message(
      'Unable to add event.',
      name: 'xceptionCalendarEventAdd',
      desc: '',
      args: [],
    );
  }

  /// `Location is not enabled.`
  String get locationNotEnabled {
    return Intl.message(
      'Location is not enabled.',
      name: 'locationNotEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are denied.`
  String get locationExceptionDenied {
    return Intl.message(
      'Location permissions are denied.',
      name: 'locationExceptionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are permanently denied. Please grant permission from device settings.`
  String get locationExceptionDeniedForever {
    return Intl.message(
      'Location permissions are permanently denied. Please grant permission from device settings.',
      name: 'locationExceptionDeniedForever',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `All Day`
  String get allDay {
    return Intl.message(
      'All Day',
      name: 'allDay',
      desc: '',
      args: [],
    );
  }

  /// `Validation Required`
  String get validationRequired {
    return Intl.message(
      'Validation Required',
      name: 'validationRequired',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Does Not Repeat`
  String get doesNotRepeat {
    return Intl.message(
      'Does Not Repeat',
      name: 'doesNotRepeat',
      desc: '',
      args: [],
    );
  }

  /// `Repeat`
  String get repeat {
    return Intl.message(
      'Repeat',
      name: 'repeat',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Every Day`
  String get everyDay {
    return Intl.message(
      'Every Day',
      name: 'everyDay',
      desc: '',
      args: [],
    );
  }

  /// `Every Week`
  String get everyWeek {
    return Intl.message(
      'Every Week',
      name: 'everyWeek',
      desc: '',
      args: [],
    );
  }

  /// `Every Month`
  String get everyMonth {
    return Intl.message(
      'Every Month',
      name: 'everyMonth',
      desc: '',
      args: [],
    );
  }

  /// `Every Year`
  String get everyYear {
    return Intl.message(
      'Every Year',
      name: 'everyYear',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `You cannot undo this action.`
  String get youCannotUndoThisAction {
    return Intl.message(
      'You cannot undo this action.',
      name: 'youCannotUndoThisAction',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message(
      'Book Now',
      name: 'bookNow',
      desc: '',
      args: [],
    );
  }

  /// `Book Your Event`
  String get bookYourEvent {
    return Intl.message(
      'Book Your Event',
      name: 'bookYourEvent',
      desc: '',
      args: [],
    );
  }

  /// `Google Event`
  String get googleEvent {
    return Intl.message(
      'Google Event',
      name: 'googleEvent',
      desc: '',
      args: [],
    );
  }

  /// `Create Custom Event`
  String get createCustomEvent {
    return Intl.message(
      'Create Custom Event',
      name: 'createCustomEvent',
      desc: '',
      args: [],
    );
  }

  /// `Today's Bookings`
  String get todaysBookings {
    return Intl.message(
      'Today\'s Bookings',
      name: 'todaysBookings',
      desc: '',
      args: [],
    );
  }

  /// `My Events`
  String get myEvents {
    return Intl.message(
      'My Events',
      name: 'myEvents',
      desc: '',
      args: [],
    );
  }

  /// `Book Manual Event`
  String get bookManualEvent {
    return Intl.message(
      'Book Manual Event',
      name: 'bookManualEvent',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Notify`
  String get notify {
    return Intl.message(
      'Notify',
      name: 'notify',
      desc: '',
      args: [],
    );
  }

  /// `Add Guest`
  String get addGuest {
    return Intl.message(
      'Add Guest',
      name: 'addGuest',
      desc: '',
      args: [],
    );
  }

  /// `Speaker`
  String get speaker {
    return Intl.message(
      'Speaker',
      name: 'speaker',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message(
      'Alert',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `The chosen time slot for this room is not available for booking. Please select the available room below.`
  String get alertDescription {
    return Intl.message(
      'The chosen time slot for this room is not available for booking. Please select the available room below.',
      name: 'alertDescription',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
