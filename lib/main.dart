import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nectar/core/data_source/local/cache_manager.dart';
import 'package:nectar/core/data_source/remote/dio_helper.dart';
import 'package:nectar/view/screens/splash_screen.dart';

import 'core/style/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nectar App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}