import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../localization/l10n.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_styles.dart';
import '../blocs/profile/profile_cubit.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>()..getProfileDetail();

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
                          context.pushRoute(const EditProfileRoute());
                        },
                      ).pad(8)),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) => state.maybeWhen(
                      orElse: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (profileModel) => Column(
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
                            profileModel.name,
                            style: AppStyles.text20PxSemiBold,
                          ),
                          12.verticalSpace,
                          Text(
                            profileModel.email,
                            style: AppStyles.text14Px,
                          ),
                          12.verticalSpace,
                          Text(
                            profileModel.designation,
                            style: AppStyles.text14Px,
                          ),
                          12.verticalSpace,
                          Text(
                            profileModel.phone,
                            style: AppStyles.text14Px,
                          ),
                          12.verticalSpace,
                          Text(
                            profileModel.preferredFloor,
                            style: AppStyles.text14Px,
                          ),
                        ],
                      ),
                    ),
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
