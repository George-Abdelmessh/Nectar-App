import 'package:flutter/material.dart';
import 'package:nectar/core/style/app_colors.dart';

class CustemButton extends StatelessWidget {
  const CustemButton({super.key, required this.ontap, required this.child});
  final Function() ontap;
  final Text child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.green,
      minWidth: double.infinity,
      height: 67,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      onPressed: ontap,
      child: child,
    );
  }
}
