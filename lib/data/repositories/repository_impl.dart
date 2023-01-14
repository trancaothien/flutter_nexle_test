import 'dart:developer';

import 'package:flutter_nexle_test/data/model/response_model.dart';
import 'package:flutter_nexle_test/data/model/category_model.dart';
import 'package:flutter_nexle_test/data/model/auth_model.dart';
import 'package:flutter_nexle_test/data/repositories/repository.dart';
import 'package:flutter_nexle_test/data/request/sign_up_request.dart';
import 'package:get/get.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl({required this.httpClient});
  final GetHttpClient httpClient;

  @override
  Future<ResponseModel<CategoriesModel>> categories(
      {int pageSize = 100, int pageNumber = 0}) async {
    var response = await httpClient
        .get<dynamic>('categories?pageSize=$pageSize&pageNumber=$pageNumber');
    log('${response.body}');
    if (response.statusCode == 200) {
      return ResponseModel(
        success: true,
        statusCode: 200,
        data: CategoriesModel.fromJson(response.body),
      );
    } else {
      return ResponseModel.fromJson(response.body);
    }
  }

  @override
  Future<ResponseModel<AuthModel>> signUp(SignUpRequest signUpRequest) async {
    final response = await httpClient.post(
      'auth/signup',
      body: signUpRequest.toJson(),
    );
    log('${response.body}');
    if (response.statusCode == 200) {
      return ResponseModel(
        success: true,
        statusCode: 200,
        data: AuthModel.fromJson(response.body),
      );
    } else {
      return ResponseModel.fromJson(response.body);
    }
  }
}
