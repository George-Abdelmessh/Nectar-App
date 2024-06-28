import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/controller/home/home_cubit.dart';
import 'package:nectar/core/style/app_colors.dart';
import 'package:nectar/view/cards/product_card.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = HomeCubit.get(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.green),
          );
        } else if (state is HomeErrorState) {
          return Center(
            child: Text(
              state.errorMsg,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          );
        }
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(
              data: cubit.productsData!.data[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 15);
          },
          itemCount: cubit.productsData!.data.length,
        );
      },
    );
  }
}
