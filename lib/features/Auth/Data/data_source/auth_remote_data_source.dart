import 'dart:developer';
import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  Future<void> login({
    required String emailController,
    required String passwordController,
  }) async {
    Dio dio = Dio();
    try {
      Response response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/login',
        data: {'email': emailController, 'password': passwordController},
      );
      log('Login: ${response.data}');
    } on DioException catch (e) {
      String errorMessage = e.response?.data.toString() ?? e.message.toString();
      log('Error: $errorMessage ');
      throw errorMessage;
    } catch (e) {
      log('Unexpected error: $e');
      throw Exception(e.toString());
    }
  }
}
