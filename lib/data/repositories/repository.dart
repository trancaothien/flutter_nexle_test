import 'package:flutter_nexle_test/data/model/auth_model.dart';
import 'package:flutter_nexle_test/data/model/category_model.dart';
import 'package:flutter_nexle_test/data/model/response_model.dart';
import 'package:flutter_nexle_test/data/request/sign_up_request.dart';

abstract class Repository {
  Future<ResponseModel<AuthModel>> signUp(SignUpRequest signUpRequest);
  Future<ResponseModel<CategoriesModel>> categories({
    int pageSize = 100,
    int pageNumber = 0,
  });
}
