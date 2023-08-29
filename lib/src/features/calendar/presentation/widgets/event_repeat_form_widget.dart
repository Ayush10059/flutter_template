import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../localization/l10n.dart';
import '../../domain/models/repeat_type.dart';
import '../blocs/create_event/create_event_cubit.dart';

class EventRepeatFormWidget extends StatelessWidget {
  const EventRepeatFormWidget({super.key});

  @override
  Widget build(context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
      builder: (context, state) {
        final groupValue = state.repeatType;

        return Column(
          children: [
            RadioListTile.adaptive(
              title: Text(l10n.doesNotRepeat),
              value: RepeatType.noRepeat,
              groupValue: groupValue,
              onChanged: (value) {
                if (value == null) return;
                context.read<CreateEventCubit>().onRepeatTypeChanged(value);
              },
            ),
            RadioListTile.adaptive(
              title: Text(l10n.everyDay),
              value: RepeatType.day,
              groupValue: groupValue,
              onChanged: (value) {
                if (value == null) return;
                context.read<CreateEventCubit>().onRepeatTypeChanged(value);
              },
            ),
            RadioListTile.adaptive(
              title: Text(l10n.everyWeek),
              value: RepeatType.week,
              groupValue: groupValue,
              onChanged: (value) {
                if (value == null) return;
                context.read<CreateEventCubit>().onRepeatTypeChanged(value);
              },
            ),
            RadioListTile.adaptive(
              title: Text(l10n.everyMonth),
              value: RepeatType.month,
              groupValue: groupValue,
              onChanged: (value) {
                if (value == null) return;
                context.read<CreateEventCubit>().onRepeatTypeChanged(value);
              },
            ),
            RadioListTile.adaptive(
              title: Text(l10n.everyYear),
              value: RepeatType.year,
              groupValue: groupValue,
              onChanged: (value) {
                if (value == null) return;
                context.read<CreateEventCubit>().onRepeatTypeChanged(value);
              },
            ),
          ],
        );
      },
    );
  }
}
