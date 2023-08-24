import '../models/event.dart';

abstract class CalendarRepository {
  Stream<List<Event>> events();
  List<Event> getEvents();
  void addEvent(Event event);
  void updateEvent(Event event);
  void deleteEvent(String id);
}
