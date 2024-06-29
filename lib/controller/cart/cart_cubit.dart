import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_helper/app_toast.dart';
import '../../core/data_source/end_points.dart';
import '../../core/data_source/remote/dio_helper.dart';
import '../../model/cart_model.dart';
import '../../params/add_to_cart_params.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  CartModel? cartData;

  Future<void> addToCart(int productId) async {
    try {
      final Response response = await DioHelper.post(
        endpoint: ADD_CART,
        data: AddToCartParams(
          productId: productId,
          quantity: 1,
        ).toJson(),
      );

      if (response.statusCode == 200) {
        showSuccessToast('The product Added Successfully');
      } else {
        showErrorToast('Something went wrong!');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getCart() async {
    try {
      emit(CartLoadingState());
      final Response response = await DioHelper.get(
        endpoint: CART,
      );

      if (response.statusCode == 200) {
        cartData = CartModel.fromJson(response.data);
        emit(CartSuccessState());
      } else {
        emit(CartErrorState(errorMsg: 'Something went wrong!'));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(CartErrorState(errorMsg: e.toString()));
    }
  }
}
