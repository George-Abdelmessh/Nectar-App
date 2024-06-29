import 'package:flutter/material.dart';
import 'package:nectar/controller/products/products_cubit.dart';

import '../../core/style/app_colors.dart';
import '../widgets/fave_items_widget.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {

  @override
  void initState() {
    super.initState();
    ProductsCubit.get(context).getAllFav();
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
              'Favorite',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Expanded(
          child: FaveItemsWidget(),
        ),
      ],
    );
  }
}
