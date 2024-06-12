import 'package:flutter/material.dart';
import '../../core/app_helper/app_navigator.dart';
import '../../core/custom_widgets/custom_text_button.dart';
import '../../core/custom_widgets/custom_text_form_field.dart';
import '../../core/style/app_colors.dart';
import '../widgets/blurred_colred_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BlurredColoredWidget(),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Enter your credentials to continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.mediumGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const CustomTextFormField(
                      hint: '',
                      label: 'Username',
                    ),
                    const SizedBox(height: 30),
                    const CustomTextFormField(
                        hint: '',
                        label:  'Email',
                        ),
                    const SizedBox(height: 30),
                    const CustomTextFormField(
                        hint: '',
                        label: 'Password',
                        suffix: Icon(
                          Icons.visibility_off_outlined,
                          color: AppColors.mediumGrey,
                        )),
                    const SizedBox(height: 30),
                    const CustomTextFormField(
                        hint: '',
                        label: 'Confirm Password',
                        suffix: Icon(
                          Icons.visibility_off_outlined,
                          color: AppColors.mediumGrey,
                        )),
                    const SizedBox(height: 25),
                    CustomTextButton(text: 'Sign Up', onTap: () {}),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () => AppNavigator.pop(context),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
