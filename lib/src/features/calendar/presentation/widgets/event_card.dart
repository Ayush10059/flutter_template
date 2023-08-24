import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/models/event.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
    this.onEventSelected,
  });

  final Event event;
  final Function(Event event)? onEventSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onEventSelected?.call(event),
      child: Card(
        color: event.allDay
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 24,
          ),
          child: event.allDay
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4,
                      ),
                      child: Text(
                        event.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 4,
                      ),
                      child: Text(
                        'All Day',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        event.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 4.r,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(
                          width: 2.r,
                        ),
                        Expanded(
                          child: Text(
                            event.eventLocation ?? 'n/a',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.r,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(
                          width: 2.r,
                        ),
                        Expanded(
                          child: Text(
                            '${DateFormat().format(event.startTime)}-${DateFormat().format(event.endTime)}',
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
