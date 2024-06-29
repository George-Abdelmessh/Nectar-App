import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/controller/cart/cart_cubit.dart';
import 'package:nectar/core/style/app_colors.dart';
import 'package:nectar/model/cart_model.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.data});

  final Item data;

  @override
  Widget build(BuildContext context) {
    final CartCubit cubit = CartCubit.get(context);
    return Padding(
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
              children: [
                Row(
                  children: [
                    Text(
                      data.product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => cubit.removeCartItem(data.id),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.lightGrey,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => cubit.decreaseQuantity(data.product.id),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.lightGrey, blurRadius: 2)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.minimize,
                                size: 18,
                                color: AppColors.lightGrey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          data.quantity.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () => cubit.increaseQuantity(data.product.id),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.lightGrey, blurRadius: 2)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: AppColors.green,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${data.quantity * data.product.price}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
