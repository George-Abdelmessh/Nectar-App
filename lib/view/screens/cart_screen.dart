import 'package:flutter/material.dart';
import 'package:nectar/controller/cart/cart_cubit.dart';
import 'package:nectar/controller/products/products_cubit.dart';
import 'package:nectar/core/style/app_colors.dart';

import '../widgets/card_items_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    CartCubit.get(context).getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.2), //(x,y)
                blurRadius: 2.0,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Expanded(
          child: CardItemsWidget(),
        ),
      ],
    );
  }
}
