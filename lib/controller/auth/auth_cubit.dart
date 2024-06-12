import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_helper/app_toast.dart';
import '../../core/data_source/local/cache_manager.dart';
import '../../params/login_params.dart';
import '../../core/data_source/end_points.dart';
import '../../core/data_source/remote/dio_helper.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> login({
    required final LoginParams params,
  }) async {
    try {
      emit(AuthLoadingState());
      final Response response = await DioHelper.post(
        endpoint: LOGIN,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        showSuccessToast('Login Success!');
        CacheManager.saveData(key: TOKEN, value: response.data[TOKEN]);
        emit(AuthSuccessState());
      } else {
        showErrorToast(response.data['message']);
        emit(AuthErrorState(response.data['message']));
      }
    } catch (e) {
      showErrorToast(e.toString());
      emit(AuthErrorState(e.toString()));
    }
  }
}
