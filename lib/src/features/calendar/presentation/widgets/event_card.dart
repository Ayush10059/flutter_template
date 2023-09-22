import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../domain/models/event_model.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
    this.onEventSelected,
  });

  final EventModel event;
  final Function(EventModel event)? onEventSelected;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(event.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            icon: Remix.delete_back_2_fill,
          ),
          SlidableAction(
            onPressed: (context) {},
            icon: Remix.edit_2_fill,
          ),
          SlidableAction(
            onPressed: (context) {},
            icon: Remix.rocket_2_fill,
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(
          Remix.calendar_fill,
          size: 12,
        ),
        title: Text(event.title),
        trailing: Text(event.startTime.toString()),
      ),
    );
  }
}
