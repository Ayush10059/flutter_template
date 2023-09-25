import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../../localization/l10n.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/form/field.dart';
import '../../../../core/form/form_status.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/models/event_model.dart';
import '../../domain/models/notify_type.dart';
import '../../domain/repository/calendar_repository.dart';
import '../blocs/create_event/create_event_cubit.dart';
import '../widgets/date_time_form_field.dart';

@RoutePage()
class CreateEventPage extends HookWidget {
  const CreateEventPage({
    super.key,
    this.event,
  });
  final EventModel? event;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateEventCubit(getIt<CalendarRepository>(), event),
      child: Scaffold(
        appBar: AppBar(),
        body: Builder(
          builder: (context) {
            return BlocConsumer<CreateEventCubit, CreateEventState>(
              listener: (context, state) {
                if (state.status == const FormStatus.success()) {
                  getIt<AppRouter>().pop();
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Book manual event',
                        style: AppStyles.text24PxSemiBold.primary,
                      ),
                      12.verticalSpace,
                      Card(
                        elevation: 8,
                        child: Padding(
                          padding: EdgeInsets.all(12.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _TitleField(),
                              8.verticalSpace,
                              Row(
                                children: [
                                  Expanded(
                                    child: DateTimeFormField(
                                      key: const ValueKey('start time'),
                                      initialValue: state.startTime,
                                      validator: (v) => RequiredValidator(
                                        errorText: l10n.validationRequired,
                                      ).call(v?.toString() ?? ''),
                                      onChanged: (value) => context
                                          .read<CreateEventCubit>()
                                          .onStartDateChanged(value),
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  Expanded(
                                    child: DateTimeFormField(
                                      key: const ValueKey('end time'),
                                      initialValue: state.startTime,
                                      validator: (v) => RequiredValidator(
                                        errorText: l10n.validationRequired,
                                      ).call(v?.toString() ?? ''),
                                      onChanged: (value) => context
                                          .read<CreateEventCubit>()
                                          .onStartDateChanged(value),
                                    ),
                                  ),
                                ],
                              ),
                              8.verticalSpace,
                              const _DescriptionField(),
                              8.verticalSpace,
                              Text(
                                'Notify',
                                style: AppStyles.text12Px,
                              ),
                              4.verticalSpace,
                              const _NotifyField(),
                              8.verticalSpace,
                              Text(
                                'Add Guest',
                                style: AppStyles.text12Px,
                              ),
                              4.verticalSpace,
                              const _AddGuestField(),
                              8.verticalSpace,
                              CustomButton(
                                label: l10n.save,
                                onPressed: () {
                                  context.read<CreateEventCubit>().onSubmit();
                                },
                                isDisabled: !state.isValid,
                                fullWidth: true,
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
          },
        ),
      ),
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateEventCubit, CreateEventState, Field<String>>(
      selector: (state) => state.title,
      builder: (context, state) {
        return TextFormField(
          style: AppStyles.text14PxMedium.primary,
          textInputAction: TextInputAction.next,
          onChanged: context.read<CreateEventCubit>().onTitleChanged,
          decoration: InputDecoration(
            errorText: state.hasError ? state.errorMessage : null,
            hintText: 'Title',
          ),
        );
      },
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateEventCubit, CreateEventState, Field<String>>(
      selector: (state) => state.description,
      builder: (context, state) {
        return TextFormField(
          minLines: 5,
          maxLines: 5,
          style: AppStyles.text14PxMedium.primary,
          textInputAction: TextInputAction.next,
          onChanged: context.read<CreateEventCubit>().onDescriptionChanged,
          decoration: InputDecoration(
            errorText: state.hasError ? state.errorMessage : null,
            hintText: 'Description',
          ),
        );
      },
    );
  }
}

class _NotifyField extends StatelessWidget {
  const _NotifyField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateEventCubit, CreateEventState, Field<String>>(
      selector: (state) => state.notify,
      builder: (context, state) {
        context.read<CreateEventCubit>().onNotifyChanged(notifyList.first);
        return DropdownButtonFormField(
          value: notifyList.first,
          items: notifyList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) => context
              .read<CreateEventCubit>()
              .onNotifyChanged(value ?? notifyList.first),
        );
      },
    );
  }
}

class _AddGuestField extends StatelessWidget {
  const _AddGuestField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateEventCubit, CreateEventState, Field<String>>(
      selector: (state) => state.addGuest,
      builder: (context, state) {
        return TextFormField(
          style: AppStyles.text14PxMedium.primary,
          textInputAction: TextInputAction.next,
          onChanged: context.read<CreateEventCubit>().onAddGuestChanged,
          decoration: InputDecoration(
            errorText: state.hasError ? state.errorMessage : null,
            hintText: 'Add Guest',
          ),
        );
      },
    );
  }
}
