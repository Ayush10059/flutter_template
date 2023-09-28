import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calendar/src/core/extensions/extensions.dart';
import 'package:calendar/src/core/extensions/typography_extension.dart';
import 'package:calendar/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../../localization/l10n.dart';
import '../../../../core/themes/app_styles.dart';
import '../../domain/models/event_model.dart';

@RoutePage()
class EventDetailPage extends StatelessWidget {
  const EventDetailPage({
    super.key,
    required this.event,
    this.onDelete,
  });
  final EventModel event;
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        );
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFF0A013B),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: const AssetImage('assets/images/meeting.jpeg'),
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.4),
                      BlendMode.modulate,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  context.back();
                },
              ).pOnly(top: 48, left: 4),
              SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(16.w, 40.h, 16.w, 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event.title.trim(),
                                  style: AppStyles.text28PxSemiBold.white,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    8.horizontalSpace,
                                    Text(
                                      DateFormat.MMMd().format(event.startTime),
                                      style: AppStyles.text12Px.white,
                                    ),
                                    16.horizontalSpace,
                                    const Icon(
                                      Icons.schedule,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    8.horizontalSpace,
                                    Text(
                                      '${DateFormat.jm().format(event.startTime)} - ${DateFormat.jm().format(event.endTime)}',
                                      style: AppStyles.text12Px.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomButton(
                            label: l10n.bookNow,
                            onPressed: () {},
                            height: 30.h,
                            isDisabled: false,
                            labelStyle: AppStyles.text12Px,
                          )
                        ],
                      ),
                      16.verticalSpace,
                      Card(
                        child: Container(
                          width: double.infinity,
                          margin: 16.all,
                          child: CustomScrollView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            slivers: [
                              SliverToBoxAdapter(
                                child: Text(
                                  event.title,
                                  style: AppStyles.text24PxSemiBold,
                                ),
                              ),
                              if (event.description != null)
                                SliverToBoxAdapter(
                                  child: Text(
                                    event.description!,
                                    style: AppStyles.text14Px.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                ),
                              SliverToBoxAdapter(
                                child: 18.verticalSpace,
                              ),
                              SliverToBoxAdapter(
                                child: Text(
                                  l10n.speaker,
                                  style: AppStyles.text18PxSemiBold,
                                ),
                              ),
                              const SliverToBoxAdapter(
                                child: Divider(),
                              ),
                              SliverToBoxAdapter(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFD9D9D9),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    12.horizontalSpace,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            event.title,
                                            style: AppStyles.text14PxSemiBold,
                                          ),
                                          Text(
                                            event.title,
                                            style: AppStyles.text10Px,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: 8.verticalSpace,
                              ),
                              SliverToBoxAdapter(
                                child: Text(
                                  l10n.guest,
                                  style: AppStyles.text18PxSemiBold,
                                ),
                              ),
                              const SliverToBoxAdapter(
                                child: Divider(),
                              ),
                              SliverList.builder(
                                itemCount: 50,
                                itemBuilder: (context, index) => const Text(
                                  'example123@gmail.com',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
