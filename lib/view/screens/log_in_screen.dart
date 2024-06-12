import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/core/app_helper/app_navigator.dart';
import 'package:nectar/core/constants/app_images.dart';
import 'package:nectar/core/custom_widgets/custom_text_button.dart';
import 'package:nectar/core/custom_widgets/custom_text_form_field.dart';
import 'package:nectar/core/style/app_colors.dart';
import 'package:nectar/view/screens/sign_up_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(AppImages.carrotLogo)),
            const SizedBox(height: 100),
            const Text(
              'Login',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            const Text(
              'Enter your emails and password',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.mediumGrey,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.mediumGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CustomTextFormField(hint: ''),
            const SizedBox(height: 30),
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.mediumGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CustomTextFormField(
                hint: '',
                suffix: Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.mediumGrey,
                )),
            const SizedBox(height: 25),
            CustomTextButton(text: 'Log In', onTap: () {}),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have an account? ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => AppNavigator.push(context, const SignUpScreen()),
                  child: const Text(
                    'Signup',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
