import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:remixicon/remixicon.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/di/injector.dart';
import '../../../../core/routes/app_router.dart';
import '../../domain/models/event_model.dart';
import '../../utils/utils.dart';
import '../blocs/calendar/calendar_cubit.dart';
import '../widgets/calendar_header.dart';
import '../widgets/day_events_widget.dart';

@RoutePage()
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CalendarCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                getIt<AppRouter>().push(CreateEventRoute());
              },
              icon: const Icon(
                Remix.add_box_line,
              ),
            ),
          ],
        ),
        body: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            return Column(
              children: [
                CalendarHeader(
                  focusedDay: state.focusedDay,
                  onLeftArrowTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  onRightArrowTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  onTodayButtonTap: () {
                    context
                        .read<CalendarCubit>()
                        .setFocusedDate(DateTime.now());
                  },
                  onYearSelectionTap: () {
                    showMonthPicker(context: context).then(
                      (DateTime? dateTime) {
                        context.read<CalendarCubit>().setFocusedDate(
                              dateTime ?? state.focusedDay,
                            );
                      },
                    );
                  },
                  calendarFormat: state.calendarFormat,
                ),
                TableCalendar<EventModel>(
                  headerVisible: false,
                  firstDay: DateTime.utc(1, 1, 1),
                  lastDay: DateTime.utc(10000, 12, 31),
                  focusedDay: state.focusedDay,
                  calendarFormat: state.calendarFormat,
                  selectedDayPredicate: (day) =>
                      isSameDay(state.selectedDay, day),
                  eventLoader: (value) => state.getEventsOfDay(value),
                  onDaySelected: (selectedDay, focusedDay) {
                    // only allow to select date if it is same month as focused
                    // day.
                    if (isSameMonthOfYear(selectedDay, focusedDay)) {
                      context
                          .read<CalendarCubit>()
                          .onDaySelected(selectedDay, focusedDay);
                    }
                  },
                  onCalendarCreated: (pageController) =>
                      _pageController = pageController,
                  onPageChanged: context.read<CalendarCubit>().onPageChanged,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  sixWeekMonthsEnforced: false,
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) {
                      final text = DateFormat.E().format(day);
                      return Center(
                        child: Text(
                          text.substring(0, 2),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      );
                    },
                    outsideBuilder: (context, day, focusedDay) {
                      // do not show days which is not from currently focused
                      // month.
                      return const SizedBox.shrink();
                    },
                    defaultBuilder: (context, day, focusedDay) {
                      return Center(
                        child: Text(
                          day.day.toString(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 20,
                          ),
                        ),
                      );
                    },
                    selectedBuilder: (context, day, focusedDay) {
                      return Center(
                        child: Container(
                          width: 39,
                          height: 39,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    todayBuilder: (context, day, focusedDay) {
                      // do not show current day if day is not from currently
                      // focused month.
                      if (!isSameMonthOfYear(day, focusedDay)) {
                        return const SizedBox.shrink();
                      }
                      return Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      );
                    },
                    markerBuilder: (context, day, events) {
                      List<Widget> markers = List.empty(growable: true);
                      if (day.month == state.focusedDay.month) {
                        events.asMap().forEach((key, value) {
                          if (key < 3) {
                            markers.add(
                              Icon(
                                Icons.circle,
                                size: 6,
                                color: value.allDay
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary,
                              ),
                            );
                          }
                        });
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: markers,
                      );
                    },
                  ),
                ),
                16.verticalSpace,
                Expanded(
                  key: ObjectKey(state.events),
                  child: ListView.builder(
                    itemCount: state.getEventMap().length,
                    itemBuilder: (context, index) {
                      DateTime eventDay =
                          state.getEventMap().keys.elementAt(index);
                      List<EventModel> events =
                          state.getEventMap().values.elementAt(index);
                      String formattedDay = DateFormat.E().format(eventDay);
                      return DayEventsWidget(
                        formattedDay: formattedDay,
                        eventDay: eventDay,
                        events: events,
                        onEventSelected: (event) {
                          context.navigateTo(
                            EventDetailRoute(
                              eventId: event.id,
                              onDelete: () {
                                context
                                    .read<CalendarCubit>()
                                    .deleteEvent(event);
                                context.router.navigate(const CalendarRoute());
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
