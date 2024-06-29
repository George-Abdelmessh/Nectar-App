import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data_source/remote/dio_helper.dart';
import '../../model/products_model.dart';
import '../../core/data_source/end_points.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());

  static ProductsCubit get(BuildContext context) => BlocProvider.of(context);

  ProductsModel? productsData;

  Future<void> getAllProducts() async {
    try {
      emit(ProductsLoadingState());
      final Response response = await DioHelper.get(endpoint: PRODUCTS);

      if (response.statusCode == 200) {
        productsData = ProductsModel.fromJson(response.data);
        emit(ProductsSuccessState());
      } else {
        emit(ProductsErrorState(errorMsg: 'Something went wrong!'));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(ProductsErrorState(errorMsg: e.toString()));
    }
  }


}
