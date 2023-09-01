import 'dart:async';

import 'package:calendar/src/features/calendar/domain/models/event_model.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/repository/calendar_repository.dart';

@LazySingleton(as: CalendarRepository)
class CalendarRepositoryImpl implements CalendarRepository {
  final List<EventModel> _events = [];

  final _streamController = StreamController<List<EventModel>>.broadcast();

  @override
  void addEvent(EventModel event) {
    _events.add(event);
    _streamController.add(_events);
  }

  @override
  void updateEvent(EventModel event) {
    final index = _events.indexWhere(
      (e) => e.id == event.id,
    );
    _events[index] = event;
    _streamController.add(_events);
  }

  @override
  void deleteEvent(String id) {
    _events.removeWhere((e) => e.id == id);
    _streamController.add(_events);
  }

  @override
  Stream<List<EventModel>> events() {
    return _streamController.stream.startWith(_events);
  }

  @override
  List<EventModel> getEvents() {
    return _events;
  }
}
