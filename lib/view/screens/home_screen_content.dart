import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_images.dart';
import '../../core/style/app_colors.dart';
import '../widgets/custom_icon_with_text.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/product_widget.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 58, right: 24, left: 24),
      child: Column(
        children: [
          SvgPicture.asset(AppImages.carrotLogo),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 7),
              CustomIconWithText(
                icon: SvgPicture.asset(
                  AppImages.location,
                ),
                text: 'Dhaka, Banassre',
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGrey.withOpacity(0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const CustomInputField(
            hint: 'Search Store',
            prefix: Icon(Icons.search_rounded),
          ),

          const Column(
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    'Exclusive Offer',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 260,
                child: ProductWidget(),
              ),

              // SizedBox(height: 30),
              // Row(
              //   children: [
              //     Text(
              //       'Best Selling',
              //       style: TextStyle(
              //         fontSize: 24,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //     Spacer(),
              //     Text(
              //       'See all',
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w600,
              //         color: AppColors.primaryColor,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 20),
              // SizedBox(
              //   height: 248,
              //   child: ProductWidget(),
              // ),
              // SizedBox(height: 30),
              // Row(
              //   children: [
              //     Text(
              //       'Groceries',
              //       style: TextStyle(
              //         fontSize: 24,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //     Spacer(),
              //     Text(
              //       'See all',
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w600,
              //         color: AppColors.primaryColor,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 20),
              // SizedBox(
              //   height: 105,
              //   child: GroceriesWidget(),
              // ),
              // SizedBox(height: 20),
              // SizedBox(
              //   height: 248,
              //   child: ProductWidget(),
              // ),
              // SizedBox(height: 30),

            ],
          )
        ],
      ),
    );

  }
}
