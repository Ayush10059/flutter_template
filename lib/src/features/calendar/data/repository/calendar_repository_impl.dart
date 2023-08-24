import 'dart:async';

import 'package:calendar/src/features/calendar/domain/models/event.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/base/base_repository.dart';
import '../../domain/repository/calendar_repository.dart';

@LazySingleton(as: CalendarRepository)
class CalendarRepositoryImpl extends BaseRepository
    implements CalendarRepository {
  final List<Event> _events = [];

  final _streamController = StreamController<List<Event>>.broadcast();

  @override
  void addEvent(Event event) {
    _events.add(event);
    _streamController.add(_events);
  }

  @override
  void updateEvent(Event event) {
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
  Stream<List<Event>> events() {
    return _streamController.stream.startWith(_events);
  }

  @override
  List<Event> getEvents() {
    return _events;
  }
}
