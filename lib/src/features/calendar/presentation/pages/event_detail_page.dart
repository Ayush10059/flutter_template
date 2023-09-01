import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../localization/l10n.dart';
import '../../../../core/async/async_value.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/routes/app_router.dart';
import '../blocs/event_details/event_details_bloc.dart';

@RoutePage()
class EventDetailPage extends StatelessWidget {
  const EventDetailPage({
    super.key,
    required this.eventId,
    this.onDelete,
  });
  final String eventId;
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventDetailsBloc(
        calendarRepository: getIt.get(),
        eventId: eventId,
      )..add(const EventDetailsEvent.getEventDetails()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Theme.of(context).colorScheme.primary,
              ),
              actions: [
                BlocBuilder<EventDetailsBloc, EventDetailsState>(
                  builder: (context, state) {
                    return PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (context) {
                        return [
                          if (state.isData)
                            PopupMenuItem<int>(
                              value: 0,
                              onTap: () {
                                context.navigateTo(
                                  CreateEventRoute(
                                    event: context
                                        .read<EventDetailsBloc>()
                                        .state
                                        .asData,
                                  ),
                                );
                              },
                              child: Text(l10n.edit),
                            ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(l10n.share),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            onTap: onDelete,
                            child: Text(l10n.delete),
                          ),
                        ];
                      },
                    );
                  },
                ),
              ],
            ),
            body: BlocBuilder<EventDetailsBloc, EventDetailsState>(
              builder: (context, state) {
                switch (state) {
                  case AsyncError(:final error):
                    return Center(child: Text(error.toLocalized(l10n)));
                  case AsyncLoading():
                    return const CircularProgressIndicator();
                  case AsyncData(:final data):
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 24.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title.trim(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          10.verticalSpace,
                          const Text(
                            'by EB Pearls',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9E9E9E),
                            ),
                          ),
                          16.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: Text(
                                  data.allDay
                                      ? l10n.allDay
                                      : '${DateFormat().format(data.startTime)} - ${DateFormat().format(data.endTime)}',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: Text(
                                  DateFormat().format(data.startTime),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          16.verticalSpace,
                          if (data.description != null)
                            Text(
                              data.description!,
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                        ],
                      ),
                    );
                  default:
                    return const CircularProgressIndicator();
                }
              },
            ),
          );
        },
      ),
    );
  }
}