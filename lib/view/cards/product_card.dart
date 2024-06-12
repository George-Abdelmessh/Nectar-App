import 'package:flutter/material.dart';
import 'package:nectar/core/constants/app_images.dart';
import 'package:nectar/core/style/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 173,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
          border: Border.all(color: AppColors.lightGrey.withOpacity(0.8)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(AppImages.apple),
              ),
              const SizedBox(height: 20),
              const Text(
                'Red Apple',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
              const SizedBox(height: 5),
              Text(
                '1kg, Priceg',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mediumGrey.withOpacity(0.8)),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    '\$4.99',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      child: const Icon(Icons.add_rounded,
                      color: AppColors.white,),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
