import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/core/constants/app_size.dart';
import 'package:nectar/core/custom_widgets/custom_text_button.dart';
import 'package:nectar/core/style/app_colors.dart';
import '../../core/constants/app_images.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.5, vertical: 65),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AppImages.onBoarding,
                ))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(AppImages.whiteLogo),
            SizedBox(height: AppSize.heightScale(context, 25)),
            const Text(
              '  Welcome \nto our store',
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 47),
            ),
            const Text(
              'Ger your groceries in as fast as one hour',
              style: TextStyle(color: AppColors.lightGrey, fontSize: 14),
            ),
            SizedBox(height: AppSize.heightScale(context, 25)),
            CustomTextButton(text: 'Get Started', onTap: () {})
          ],
        ),
      ),
    );
  }
}
