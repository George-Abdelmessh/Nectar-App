import 'package:flutter/material.dart';
import 'package:nectar/controller/auth/auth_cubit.dart';
import 'package:nectar/core/app_helper/app_navigator.dart';
import 'package:nectar/core/constants/app_images.dart';
import 'package:nectar/core/data_source/end_points.dart';
import 'package:nectar/core/data_source/local/cache_manager.dart';
import 'package:nectar/core/style/app_colors.dart';
import 'package:nectar/params/auth_params.dart';
import 'package:nectar/view/screens/home_screen.dart';
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
    autoLoginHandler();
  }

  void autoLoginHandler() {
    final AuthCubit cubit = AuthCubit.get(context);
    if (CacheManager.getDate(key: TOKEN) != null) {
      cubit
          .login(
        params: AuthParams(
          email: cubit.decode(CacheManager.getDate(key: EMAIL)),
          password: cubit.decode(CacheManager.getDate(key: PASSWORD)),
        ),
      )
          .then((value) {
        AppNavigator.pushRemove(context, const HomeScreen());
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        AppNavigator.pushRemove(context, const OnBoardingScreen());
      });
    }
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
