import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calendar/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/themes/theme.dart';
import '../../domain/models/event_model.dart';
import '../blocs/calendar/calendar_cubit.dart';

@RoutePage()
class MyEventsPage extends StatelessWidget {
  const MyEventsPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16.h),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text(
                    'Ground Floor',
                    style: AppStyles.text28PxSemiBold.primary,
                  ),
                ),
                SliverList.builder(
                  key: ObjectKey(state.events),
                  itemCount: state.getEventMap().length,
                  itemBuilder: (context, index) {
                    List<EventModel> events =
                        state.getEventMap().values.elementAt(index);
                    return Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: GestureDetector(
                          onTap: () {
                            context.navigateTo(
                              EventDetailRoute(
                                eventId: events[index].id,
                              ),
                            );
                          },
                          child: Card(
                            elevation: 8,
                            child: Container(
                              height: 42.h,
                              margin: EdgeInsets.symmetric(vertical: 12.h),
                              child: Row(
                                children: [
                                  12.horizontalSpace,
                                  SizedBox(
                                    width: 42.w,
                                    child: Text(
                                      '${DateFormat('MMMd').format(events[index].startTime)}',
                                      style: AppStyles.text16PxBold,
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  8.horizontalSpace,
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.events[index].title,
                                        style: AppStyles.text14PxSemiBold,
                                      ),
                                      Text(
                                        '${DateFormat('jm').format(events[index].startTime)} - ${DateFormat('jm').format(events[index].endTime)}',
                                        style: AppStyles.text10Px,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Remix.delete_back_2_fill,
                                      size: 12,
                                    ),
                                  ),
                                  IconButton(
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Remix.edit_2_fill,
                                      size: 12,
                                    ),
                                  ),
                                  IconButton(
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Remix.rocket_2_fill,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
