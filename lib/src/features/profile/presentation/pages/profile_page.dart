import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calendar/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../localization/l10n.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_styles.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: 16.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.profile,
              style: AppStyles.text24PxSemiBold,
            ),
            const Divider(),
            4.verticalSpace,
            Card(
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          context.navigateTo(const EditProfileRoute());
                        },
                      ).pad(8)),
                  Column(
                    children: [
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.tertiary),
                          image: DecorationImage(
                            image: AssetImage(Assets.images.meeting.path),
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
                  ).pad(48)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
