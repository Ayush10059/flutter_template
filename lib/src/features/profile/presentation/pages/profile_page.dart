import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calendar/src/core/extensions/extensions.dart';
import 'package:calendar/src/core/routes/app_router.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/app_styles.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: AppStyles.text24PxSemiBold.primary,
            ),
            const Divider(),
            4.verticalSpace,
            Card(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          context.navigateTo(const EditProfileRoute());
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(48.w),
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF7350FF)),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/meeting.jpeg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        22.verticalSpace,
                        Text(
                          'Hari Bhandari',
                          style: AppStyles.text20PxSemiBold,
                        ),
                        12.verticalSpace,
                        Text(
                          'example22@gmail.com',
                          style: AppStyles.text14Px,
                        ),
                        12.verticalSpace,
                        Text(
                          'Project Manager',
                          style: AppStyles.text14Px,
                        ),
                        12.verticalSpace,
                        Text(
                          '+977-9878882929',
                          style: AppStyles.text14Px,
                        ),
                        12.verticalSpace,
                        Text(
                          'Ground Floor',
                          style: AppStyles.text14Px,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
