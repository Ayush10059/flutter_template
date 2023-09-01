import '../models/event_model.dart';

abstract class CalendarRepository {
  Stream<List<EventModel>> events();

  List<EventModel> getEvents();

  void addEvent(EventModel event);

  void updateEvent(EventModel event);

  void deleteEvent(String id);
}
