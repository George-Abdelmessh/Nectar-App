import 'package:flutter/material.dart';
import 'package:nectar/view/cards/product_card.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const ProductCard();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 15);
      },
      itemCount: 3,
    );
  }
}
