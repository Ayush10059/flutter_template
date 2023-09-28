import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/themes/theme.dart';
import '../../domain/models/event_model.dart';
import '../blocs/calendar/calendar_cubit.dart';
import '../widgets/event_card.dart';

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
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text(
                  'Ground Floor',
                  style: AppStyles.text28PxSemiBold,
                ),
              ),
              SliverList.builder(
                key: ObjectKey(state.events),
                itemCount: state.getEventMap().length,
                itemBuilder: (context, index) {
                  List<EventModel> events =
                      state.getEventMap().values.elementAt(index);
                  return Container(
                    child: GestureDetector(
                      onTap: () {
                        context.navigateTo(
                          EventDetailRoute(event: events[index]),
                        );
                      },
                      child: EventCard(
                        event: events[index],
                        isGoogleEvent: false,
                      ),
                    ).py(4),
                  );
                },
              ),
            ],
          ).px(16);
        },
      ),
    );
  }
}
