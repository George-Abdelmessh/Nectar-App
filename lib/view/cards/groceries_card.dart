import 'package:flutter/cupertino.dart';
import 'package:nectar/core/constants/app_images.dart';
import 'package:nectar/core/style/app_colors.dart';

class GroceriesCard extends StatelessWidget {
  const GroceriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 248,
        height: 105,
        decoration: BoxDecoration(
          color: AppColors.softOrange.withOpacity(0.3),
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Image.asset(AppImages.pulses),
              const SizedBox(width: 15),
              const Text(
                'Pulses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
