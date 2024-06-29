import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/controller/cart/cart_cubit.dart';
import 'package:nectar/core/style/app_colors.dart';

import '../cards/cart_item_card.dart';

class CardItemsWidget extends StatelessWidget {
  const CardItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CartCubit cubit = CartCubit.get(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.green),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return CartItemCard(
              data: cubit.cartData!.data.items[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: cubit.cartData!.data.items.length,
        );
      },
    );
  }
}
