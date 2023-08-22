import 'package:flutter/material.dart';

import '../../domain/model/event.dart';
import 'event_card.dart';

class DayEventsWidget extends StatelessWidget {
  const DayEventsWidget({
    super.key,
    required this.formattedDay,
    required this.eventDay,
    required this.events,
    this.onEventSelected,
  });

  final String formattedDay;
  final DateTime eventDay;
  final List<Event> events;
  final Function(Event event)? onEventSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formattedDay,
                style: const TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                eventDay.day.toString(),
                style: const TextStyle(
                  color: Color(0xFF212525),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 10,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: events.length,
            itemBuilder: (context, index) {
              return EventCard(
                event: events[index],
                onEventSelected: onEventSelected,
              );
            },
          ),
        ),
      ],
    );
  }
}
