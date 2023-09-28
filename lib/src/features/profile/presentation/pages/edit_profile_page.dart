import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calendar/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../localization/l10n.dart';
import '../../../../core/themes/theme.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/widgets.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
              'Edit Profile',
              style: AppStyles.text24PxSemiBold,
            ),
            const Divider(),
            4.verticalSpace,
            Card(
              child: Column(
                children: [
                  Container(
                    padding: 4.all,
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
                  12.verticalSpace,
                  CustomTextFormField(
                    labelText: l10n.name,
                  ),
                  12.verticalSpace,
                  CustomTextFormField(
                    labelText: l10n.email,
                  ),
                  12.verticalSpace,
                  CustomTextFormField(
                    labelText: l10n.designation,
                  ),
                  12.verticalSpace,
                  CustomTextFormField(
                    labelText: l10n.phone,
                  ),
                  12.verticalSpace,
                  CustomTextFormField(
                    labelText: l10n.preferredFloor,
                  ),
                  22.verticalSpace,
                  CustomButton(
                    label: l10n.update,
                    onPressed: () {},
                    fullWidth: true,
                  ).px(32)
                ],
              ).pad(16),
            )
          ],
        ),
      ),
    );
  }
}
