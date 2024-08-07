import 'package:flutter/material.dart';
import 'package:nectar/core/app_helper/app_navigator.dart';
import 'package:nectar/core/constants/app_images.dart';
import 'package:nectar/core/style/app_colors.dart';
import 'package:nectar/view/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      AppNavigator.pushRemove(context, const OnBoardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(
          AppImages.splash,
        ),
      ),
    );
  }
}
