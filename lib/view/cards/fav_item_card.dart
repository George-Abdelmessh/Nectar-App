import 'package:flutter/material.dart';
import 'package:nectar/core/app_helper/app_navigator.dart';
import 'package:nectar/core/style/app_colors.dart';
import 'package:nectar/model/cart_model.dart';
import 'package:nectar/view/screens/product_details_screen.dart';

class FavItemCard extends StatelessWidget {
  const FavItemCard({super.key, required this.data});

  final Item data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigator.push(
          context,
          ProductDetailsScreen(
            data: data.product,
          )),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              data.product.image,
              width: 40,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${data.product.price}',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGrey),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: AppColors.lightGrey,
            )
          ],
        ),
      ),
    );
  }
}
