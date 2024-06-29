import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/controller/auth/auth_cubit.dart';
import 'package:nectar/controller/auth/auth_states.dart';
import 'package:nectar/core/app_helper/app_navigator.dart';
import 'package:nectar/core/custom_widgets/custom_text_button.dart';
import 'package:nectar/view/screens/onboarding_screen.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          AppNavigator.pushRemove(context, const OnBoardingScreen());
        }
      },
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: 120,
            child: CustomTextButton(
              text: 'Logout',
              onTap: () => AuthCubit.get(context).logout(),
            ),
          ),
        );
      },
    );
  }
}
