import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../localization/l10n.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/form/field.dart';
import '../../../../core/themes/theme.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/widgets.dart';
import '../blocs/profile/profile_cubit.dart';
import '../blocs/profile_form_cubit.dart/profile_form_cubit.dart';

@RoutePage()
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileFormCubit>(),
        ),
      ],
      child: Scaffold(
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
                child: BlocBuilder<ProfileFormCubit, ProfileFormState>(
                    builder: (context, state) {
                  return Column(
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
                      BlocSelector<ProfileFormCubit, ProfileFormState,
                          Field<String>>(
                        selector: (state) => state.name,
                        builder: (context, state) {
                          return CustomTextFormField(
                            labelText: l10n.name,
                            onChanged:
                                context.read<ProfileFormCubit>().onNameChange,
                          );
                        },
                      ),
                      12.verticalSpace,
                      BlocSelector<ProfileFormCubit, ProfileFormState,
                          Field<String>>(
                        selector: (state) => state.email,
                        builder: (context, state) {
                          return CustomTextFormField(
                            labelText: l10n.email,
                            onChanged:
                                context.read<ProfileFormCubit>().onEmailChange,
                            keyboardType: TextInputType.emailAddress,
                            errorText:
                                state.hasError ? state.errorMessage : null,
                          );
                        },
                      ),
                      12.verticalSpace,
                      BlocSelector<ProfileFormCubit, ProfileFormState,
                          Field<String>>(
                        selector: (state) => state.designation,
                        builder: (context, state) {
                          return CustomTextFormField(
                            labelText: l10n.designation,
                            onChanged: context
                                .read<ProfileFormCubit>()
                                .onDesignationChange,
                          );
                        },
                      ),
                      12.verticalSpace,
                      BlocSelector<ProfileFormCubit, ProfileFormState,
                          Field<String>>(
                        selector: (state) => state.phone,
                        builder: (context, state) {
                          return CustomTextFormField(
                            labelText: l10n.phone,
                            onChanged:
                                context.read<ProfileFormCubit>().onPhoneChange,
                            keyboardType: TextInputType.phone,
                            errorText:
                                state.hasError ? state.errorMessage : null,
                          );
                        },
                      ),
                      12.verticalSpace,
                      BlocSelector<ProfileFormCubit, ProfileFormState,
                          Field<String>>(
                        selector: (state) => state.preferredFloor,
                        builder: (context, state) {
                          return CustomTextFormField(
                            labelText: l10n.preferredFloor,
                            onChanged: context
                                .read<ProfileFormCubit>()
                                .onPreferredFloorChange,
                          );
                        },
                      ),
                      22.verticalSpace,
                      BlocBuilder<ProfileFormCubit, ProfileFormState>(
                        builder: (context, state) {
                          final loading = context.select<ProfileCubit, bool>(
                            (value) => value.state.maybeWhen(
                              orElse: () => false,
                              loading: () => true,
                            ),
                          );
                          return CustomButton(
                            onPressed: () {
                              context.read<ProfileCubit>().updateUserProfile(
                                    context
                                        .read<ProfileFormCubit>()
                                        .getProfileDto,
                                  );
                            },
                            isDisabled: !state.isValid,
                            loading: loading,
                            label: l10n.login,
                            fullWidth: true,
                          ).px(32);
                        },
                      ),
                    ],
                  ).pad(16);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
