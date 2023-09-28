import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:calendar/localization/l10n.dart';
import 'package:calendar/src/core/extensions/extensions.dart';
import 'package:calendar/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

import '../../../../core/themes/app_styles.dart';
import '../../domain/models/event_model.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
    required this.isGoogleEvent,
  });
  final EventModel event;

  final bool isGoogleEvent;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                '${DateFormat('MMMd').format(event.startTime)}',
                style: AppStyles.text16PxBold,
              ),
            ),
            const VerticalDivider(),
            8.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: AppStyles.text14PxSemiBold,
                ),
                Text(
                  '${DateFormat('jm').format(event.startTime)} - ${DateFormat('jm').format(event.endTime)}',
                  style: AppStyles.text10Px,
                ),
              ],
            ),
            const Spacer(),
            if (isGoogleEvent)
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: CustomButton(
                  label: l10n.bookNow,
                  // TODO: @Prabin Lamsal make dynamic, time icon, and container color
                  onPressed: () => context.showCustomDialog(
                    icon: const Icon(Icons.add_alert),
                    title: l10n.alert,
                    description: l10n.alertDescription,
                    content: Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _alertTimeSlotButton(
                            floor: 'Second Floor',
                            timeSlot: '8:50 am - 9: 30am',
                          ),
                          _alertTimeSlotButton(
                            floor: 'Second Floor',
                            timeSlot: '8:50 am - 9: 30am',
                          ),
                        ],
                      ),
                    ),
                  ),
                  height: 30.h,
                  labelStyle: AppStyles.text12Px,
                  isDisabled: false,
                ),
              ),
            if (!isGoogleEvent)
              Row(
                children: [
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
          ],
        ),
      ),
    );
  }
}

Widget _alertTimeSlotButton({
  required String floor,
  required String timeSlot,
}) {
  return Container(
    height: 88,
    padding: EdgeInsets.all(10.w),
    decoration: ShapeDecoration(
      color: Colors.purple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    child: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          floor,
          style: AppStyles.text12PxBold,
        ),
        Row(
          children: [
            const Icon(
              Icons.watch_later_outlined,
              size: 10,
            ),
            Text(
              timeSlot,
              style: AppStyles.text10Px,
            ),
          ],
        )
      ]),
    ),
  );
}
