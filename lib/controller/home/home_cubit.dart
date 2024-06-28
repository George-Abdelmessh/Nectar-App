import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/data_source/remote/dio_helper.dart';
import 'package:nectar/model/products_model.dart';

import '../../core/data_source/end_points.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  ProductsModel? productsData;

  Future<void> getHomeData() async {
    try {
      emit(HomeLoadingState());
      final Response response = await DioHelper.get(endpoint: PRODUCTS);

      if (response.statusCode == 200) {
        productsData = ProductsModel.fromJson(response.data);
        emit(HomeSuccessState());
      } else {
        emit(HomeErrorState(errorMsg: 'Something went wrong!'));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(HomeErrorState(errorMsg: e.toString()));
    }
  }
}
