import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calendar/src/core/extensions/extensions.dart';
import 'package:calendar/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/app_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';

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
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Profile',
              style: AppStyles.text24PxSemiBold.primary,
            ),
            const Divider(),
            4.verticalSpace,
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.w),
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
                    12.verticalSpace,
                    const CustomTextFormField(
                      labelText: 'Name',
                    ),
                    12.verticalSpace,
                    const CustomTextFormField(
                      labelText: 'Email',
                    ),
                    12.verticalSpace,
                    const CustomTextFormField(
                      labelText: 'Designation',
                    ),
                    12.verticalSpace,
                    const CustomTextFormField(
                      labelText: 'Phone',
                    ),
                    12.verticalSpace,
                    const CustomTextFormField(
                      labelText: 'Preferred Floor',
                    ),
                    22.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: CustomButton(
                        label: 'Update',
                        onPressed: () {},
                        fullWidth: true,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
