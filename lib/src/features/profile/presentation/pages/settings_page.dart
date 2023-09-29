import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calendar/src/core/extensions/widget_extension.dart';
import 'package:calendar/src/core/routes/app_router.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../localization/l10n.dart';
import '../../../../core/themes/theme.dart';
import '../../../../core/widgets/widgets.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.settings,
              style: AppStyles.text28PxSemiBold,
            ),
            const Divider(),
            5.verticalSpace,
            ListTile(
              dense: true,
              leading: SvgImage(
                Assets.icons.profile,
                color: AppColors.tertiary,
              ),
              title: Text(l10n.profile),
              trailing: const Icon(
                Icons.chevron_right,
                color: AppColors.textGrey,
              ),
              onTap: () {
                context.navigateTo(const ProfileRoute());
              },
            ),
            ListTile(
              dense: true,
              leading: SvgImage(
                Assets.icons.notification,
                color: AppColors.tertiary,
              ),
              title: Text(l10n.notifications),
              trailing: const Icon(
                Icons.chevron_right,
                color: AppColors.textGrey,
              ),
            )
          ],
        ),
      ).px(12),
    );
  }
}
