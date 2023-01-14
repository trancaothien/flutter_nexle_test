import 'package:flutter_nexle_test/presentation/sign_up/sign_up_view_model.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() => Get.put<SignUpViewModel>(SignUpViewModel());
}
