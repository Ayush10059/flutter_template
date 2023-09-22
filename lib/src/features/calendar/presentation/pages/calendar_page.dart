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
import '../widgets/event_card.dart';

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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Column(
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
                              onYearSelectionTap: () {
                                showMonthPicker(context: context).then(
                                  (DateTime? dateTime) {
                                    context
                                        .read<CalendarCubit>()
                                        .setFocusedDate(
                                          dateTime ?? state.focusedDay,
                                        );
                                  },
                                );
                              },
                              calendarFormat: state.calendarFormat,
                            ),
                            TableCalendar<EventModel>(
                              headerVisible: false,
                              rowHeight: 40.0,
                              daysOfWeekHeight: 40.0,
                              firstDay: DateTime.utc(1, 1, 1),
                              lastDay: DateTime.utc(10000, 12, 31),
                              focusedDay: state.focusedDay,
                              calendarFormat: state.calendarFormat,
                              selectedDayPredicate: (day) =>
                                  isSameDay(state.selectedDay, day),
                              eventLoader: (value) =>
                                  state.getEventsOfDay(value),
                              onDaySelected: (selectedDay, focusedDay) {
                                // only allow to select date if it is same month as focused
                                // day.
                                if (isSameMonthOfYear(
                                    selectedDay, focusedDay)) {
                                  context
                                      .read<CalendarCubit>()
                                      .onDaySelected(selectedDay, focusedDay);
                                }
                              },
                              onCalendarCreated: (pageController) =>
                                  _pageController = pageController,
                              onPageChanged:
                                  context.read<CalendarCubit>().onPageChanged,
                              startingDayOfWeek: StartingDayOfWeek.monday,
                              calendarBuilders: CalendarBuilders(
                                dowBuilder: (context, day) {
                                  final text = DateFormat.E().format(day);
                                  return Center(
                                    child: Text(
                                      text,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      ),
                                    ),
                                  );
                                },
                                defaultBuilder: (context, day, focusedDay) {
                                  return Center(
                                      child: Text(day.day.toString()));
                                },
                                selectedBuilder: (context, day, focusedDay) {
                                  return Center(
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            width: 1,
                                            color: Color(0xFFB29BDA),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(day.day.toString()),
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: CustomScrollView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          slivers: [
                            SliverToBoxAdapter(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Todays Bookings',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Spacer(),
                                      Transform.scale(
                                        scale: 0.7,
                                        child: Checkbox(
                                          visualDensity: const VisualDensity(
                                            horizontal: -4.0,
                                            vertical: -4.0,
                                          ),
                                          value: true,
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      const Text(
                                        'My Events',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider()
                                ],
                              ),
                            ),
                            SliverList.builder(
                              key: ObjectKey(state.events),
                              itemCount: state.getEventMap().length,
                              itemBuilder: (context, index) {
                                List<EventModel> events =
                                    state.getEventMap().values.elementAt(index);
                                return EventCard(
                                  event: events[index],
                                  onEventSelected: (event) {
                                    context.navigateTo(
                                      EventDetailRoute(
                                        eventId: event.id,
                                        onDelete: () {
                                          context
                                              .read<CalendarCubit>()
                                              .deleteEvent(event);
                                          context.router
                                              .navigate(const CalendarRoute());
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
