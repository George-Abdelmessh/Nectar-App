import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/app_helper/app_navigator.dart';
import '../../core/constants/app_images.dart';
import '../../core/custom_widgets/custom_text_button.dart';
import '../../core/custom_widgets/custom_text_form_field.dart';
import '../../core/style/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            const SizedBox(height: 50),
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
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
            const Text(
              'Username',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.mediumGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CustomTextFormField(hint: ''),
            const SizedBox(height: 30),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.mediumGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CustomTextFormField(
                hint: '',
                suffix: Icon(
                  Icons.check,
                  color: AppColors.primaryColor,
                )),
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
            const SizedBox(height: 30),
            const Text(
              'Confirm Password',
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
            const SizedBox(
              height: 25
            ),
            CustomTextButton(text: 'Sign Up', onTap: () {}),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => AppNavigator.pop(context),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
