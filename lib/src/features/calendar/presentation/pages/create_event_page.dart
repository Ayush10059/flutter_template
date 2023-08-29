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
import '../../../../core/widgets/labeled_widget.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/models/event.dart';
import '../../domain/repository/calendar_repository.dart';
import '../blocs/create_event/create_event_cubit.dart';
import '../widgets/date_time_form_field.dart';
import '../widgets/event_repeat_form_widget.dart';

@RoutePage()
class CreateEventPage extends HookWidget {
  const CreateEventPage({
    super.key,
    this.event,
  });
  final Event? event;

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
                  padding: EdgeInsets.all(10.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _TitleField(),
                      16.verticalSpace,
                      SwitchListTile.adaptive(
                        title: Text(l10n.allDay),
                        value: state.allDay,
                        onChanged: (value) {
                          context
                              .read<CreateEventCubit>()
                              .onAllDayCheckChanged(value);
                        },
                      ),
                      16.verticalSpace,
                      LabeledWidget(
                        labelText: l10n.startDate,
                        child: state.allDay
                            ? DateTimeFormField(
                                key: const ValueKey(DatePickerType.date),
                                type: DatePickerType.date,
                                initialValue: state.startTime,
                                validator: (v) => RequiredValidator(
                                  errorText: l10n.validationRequired,
                                ).call(v?.toString() ?? ''),
                                onChanged: (value) => context
                                    .read<CreateEventCubit>()
                                    .onStartDateChanged(value),
                              )
                            : DateTimeFormField(
                                key: const ValueKey(DatePickerType.dateTime),
                                type: DatePickerType.dateTime,
                                initialValue: state.startTime,
                                validator: (v) => RequiredValidator(
                                  errorText: l10n.validationRequired,
                                ).call(v?.toString() ?? ''),
                                onChanged: (value) => context
                                    .read<CreateEventCubit>()
                                    .onStartDateChanged(value),
                              ),
                      ),
                      16.verticalSpace,
                      LabeledWidget(
                        labelText: l10n.endDate,
                        child: state.allDay
                            ? DateTimeFormField(
                                key: const ValueKey(DatePickerType.date),
                                type: DatePickerType.date,
                                initialValue: state.endTime,
                                firstDate: state.startTime,
                                validator: (v) => RequiredValidator(
                                  errorText: l10n.validationRequired,
                                ).call(v?.toString() ?? ''),
                                onChanged: (value) => context
                                    .read<CreateEventCubit>()
                                    .onEndDateChanged(value),
                              )
                            : DateTimeFormField(
                                key: const ValueKey(DatePickerType.dateTime),
                                type: DatePickerType.dateTime,
                                initialValue: state.endTime,
                                firstDate: state.startTime,
                                validator: (v) => RequiredValidator(
                                  errorText: l10n.validationRequired,
                                ).call(v?.toString() ?? ''),
                                onChanged: (value) => context
                                    .read<CreateEventCubit>()
                                    .onEndDateChanged(value),
                              ),
                      ),
                      16.verticalSpace,
                      const _DescriptionField(),
                      16.verticalSpace,
                      ListTile(
                        title: Text(l10n.doesNotRepeat),
                        leading: const Icon(Icons.repeat),
                        onTap: () {
                          final bloc =
                              BlocProvider.of<CreateEventCubit>(context);
                          context.showCustomDialog(
                            content: BlocProvider<CreateEventCubit>.value(
                              value: bloc,
                              child: const EventRepeatFormWidget(),
                            ),
                            title: l10n.repeat,
                            actionTitle: l10n.save,
                            barrierDismissle: true,
                          );
                        },
                      ),
                      16.verticalSpace,
                      CustomButton(
                        onPressed: () {
                          context.read<CreateEventCubit>().onSubmit();
                        },
                        isDisabled: !state.isValid,
                        label: l10n.save,
                        fullWidth: true,
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
