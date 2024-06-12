import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar/controller/nav_bar/nav_bar_state.dart';
import 'package:nectar/core/constants/app_images.dart';
import 'package:nectar/core/style/app_colors.dart';

import '../../controller/nav_bar/nav_bar_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            currentIndex: NavBarCubit.get(context).currentIndex,
            unselectedItemColor: AppColors.black,
            onTap: (index) => NavBarCubit.get(context).changeNavBarIndex(index),
            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.shop), label: 'Shop'),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.explore), label: 'Explore'),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.cart), label: 'Cart'),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.favourite), label: 'Favourite'),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.account), label: 'Account'),
            ],
          );
        }
      ),
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return SafeArea(
            child: NavBarCubit.get(context)
                .screens[NavBarCubit.get(context).currentIndex],
          );
        },
      ),

      // Padding(
      //   padding: const EdgeInsets.only(top: 65, right: 24, left: 24),
      //   child: Column(
      //     children: [
      //       Image.asset(AppImages.carrot),
      //       const SizedBox(height: 7),
      //       CustomIconWithText(
      //         icon: Icon(
      //           Icons.location_on_rounded,
      //           color: AppColors.darkGrey.withOpacity(0.8),
      //         ),
      //         text: 'Dhaka, Banassre',
      //         textStyle: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.w600,
      //           color: AppColors.darkGrey.withOpacity(0.8),
      //         ),
      //       ),
      //       const SizedBox(height: 20),
      //       const CustomInputField(
      //         hint: 'Search Store',
      //         prefix: Icon(Icons.search_rounded),
      //       ),
      //       ///
      //       /// TODO Banner
      //       ///
      //       const Expanded(
      //         child: SingleChildScrollView(
      //           child: Column(
      //             children: [
      //               SizedBox(height: 30),
      //               Row(
      //                 children: [
      //                   Text(
      //                     'Exclusive Offer',
      //                     style: TextStyle(
      //                       fontSize: 24,
      //                       fontWeight: FontWeight.w600,
      //                     ),
      //                   ),
      //                   Spacer(),
      //                   Text(
      //                     'See all',
      //                     style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w600,
      //                       color: AppColors.mediumSeaGreen,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               SizedBox(height: 20),
      //               SizedBox(
      //                 height: 248,
      //                 child: ProductWidget(),
      //               ),
      //               SizedBox(height: 30),
      //               Row(
      //                 children: [
      //                   Text(
      //                     'Best Selling',
      //                     style: TextStyle(
      //                       fontSize: 24,
      //                       fontWeight: FontWeight.w600,
      //                     ),
      //                   ),
      //                   Spacer(),
      //                   Text(
      //                     'See all',
      //                     style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w600,
      //                       color: AppColors.mediumSeaGreen,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               SizedBox(height: 20),
      //               SizedBox(
      //                 height: 248,
      //                 child: ProductWidget(),
      //               ),
      //               SizedBox(height: 30),
      //               Row(
      //                 children: [
      //                   Text(
      //                     'Groceries',
      //                     style: TextStyle(
      //                       fontSize: 24,
      //                       fontWeight: FontWeight.w600,
      //                     ),
      //                   ),
      //                   Spacer(),
      //                   Text(
      //                     'See all',
      //                     style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w600,
      //                       color: AppColors.mediumSeaGreen,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               SizedBox(height: 20),
      //               SizedBox(
      //                 height: 105,
      //                 child: GroceriesWidget(),
      //               ),
      //               SizedBox(height: 20),
      //               SizedBox(
      //                 height: 248,
      //                 child: ProductWidget(),
      //               ),
      //               SizedBox(height: 30),
      //
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
