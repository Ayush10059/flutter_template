import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';

import '../../../../../localization/l10n.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/form/field.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/themes/theme.dart';
import '../../../../core/widgets/widgets.dart';
import '../blocs/login/login_cubit.dart';
import '../blocs/login_form/login_form_cubit.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginFormCubit>(create: (_) => getIt<LoginFormCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SingleChildScrollView(
          padding: 20.all,
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                error: (message) {
                  context.showSnackbar(
                    title: l10n.login,
                    message: message.toString(),
                    error: true,
                  );
                },
                success: () {
                  context.showSnackbar(title: l10n.login, message: 'success');
                  getIt<AppRouter>().replaceAll([const DashboardRoute()]);
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.email,
                  style: AppStyles.text14PxMedium.textGrey,
                ),
                8.verticalSpace,
                const _EmailField(),
                20.verticalSpace,
                Text(
                  l10n.password,
                  style: AppStyles.text14PxMedium.textGrey,
                ),
                8.verticalSpace,
                const _PasswordField(),
                30.verticalSpace,
                BlocBuilder<LoginFormCubit, LoginFormState>(
                  builder: (context, state) {
                    final loading = context.select<LoginCubit, bool>(
                      (value) => value.state.maybeWhen(
                        orElse: () => false,
                        loading: () => true,
                      ),
                    );
                    return CustomButton(
                      onPressed: () {
                        context
                            .read<LoginCubit>()
                            .login(context.read<LoginFormCubit>().getLoginDto);
                      },
                      isDisabled: !state.isValid,
                      loading: loading,
                      label: l10n.login,
                      fullWidth: true,
                    );
                  },
                ),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginFormCubit, LoginFormState, Field<String>>(
      selector: (state) => state.password,
      builder: (context, state) {
        return TextFormField(
          style: AppStyles.text14PxMedium,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: state.obscureText,
          onChanged: context.read<LoginFormCubit>().onPasswordChange,
          decoration: InputDecoration(
            errorText: state.hasError ? state.errorMessage : null,
            hintText: l10n.passwordHint,
            suffixIcon: IconButton(
              onPressed: context.read<LoginFormCubit>().togglePassword,
              icon: Icon(
                  state.obscureText ? Remix.eye_line : Remix.eye_close_line),
            ),
          ),
        );
      },
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginFormCubit, LoginFormState, Field<String>>(
      selector: (state) => state.email,
      builder: (context, state) {
        return TextFormField(
          style: AppStyles.text14PxMedium,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: context.read<LoginFormCubit>().onEmailChange,
          decoration: InputDecoration(
            errorText: state.hasError ? state.errorMessage : null,
            hintText: l10n.emailHint,
          ),
        );
      },
    );
  }
}
