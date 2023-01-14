import 'package:flutter/material.dart';
import 'package:flutter_nexle_test/app/app_enums.dart';
import 'package:flutter_nexle_test/app/app_extensions.dart';
import 'package:flutter_nexle_test/app/app_pref.dart';
import 'package:flutter_nexle_test/data/repositories/repository_impl.dart';
import 'package:flutter_nexle_test/data/request/sign_up_request.dart';
import 'package:flutter_nexle_test/presentation/base/base_view_model.dart';
import 'package:flutter_nexle_test/presentation/resources/colors.dart';
import 'package:flutter_nexle_test/presentation/resources/fonts.dart';
import 'package:flutter_nexle_test/presentation/resources/values.dart';
import 'package:get/get.dart';

import '../resources/routes.dart';

class SignUpViewModel extends BaseViewModel {
  // Rx
  final isAllowTermAndService = false.obs;
  final isShowPasswork = false.obs;
  final passwordLevel = PasswordLevel.none.obs;
  final isValidationEmail = false.obs;
  final isFocusPassword = false.obs;

  // Controller
  final emailEditingController = TextEditingController();
  final passworkEditingController = TextEditingController();

  //
  final passwordFocusNode = FocusNode();

  // Repo
  final repo = Get.find<RepositoryImpl>();

  void onOpenOrCloseEye() {
    isShowPasswork.value = !isShowPasswork.value;
  }

  void onSelectTermService() {
    isAllowTermAndService.value = !isAllowTermAndService.value;
  }

  Future signUp() async {
    if (!_isValidate()) return;
    setLoading(true);
    final body = SignUpRequest(
      firstName: 'Tran Cao',
      lastName: 'Thiem',
      email: emailEditingController.text.trim(),
      password: passworkEditingController.text.trim(),
    );
    var response = await repo.signUp(body);
    if (response.success!) {
      AppPref()
        ..setAccessToken(response.data?.token ?? '')
        ..setRefreshToken(response.data?.refreshToken ?? '');
      _goToCategories();
    } else {
      Get.showSnackbar(
        GetSnackBar(
          message: response.errors?.message?[0] ?? '',
          borderRadius: AppRadius.r8,
          margin: EdgeInsets.all(AppMargin.m18),
          titleText: Text(
            'Error',
            style: TextStyle(
              fontSize: FontSizes.s18,
              color: ColorsManager.red,
            ),
          ),
        ),
      );
    }
    setLoading(false);
  }

  void _goToCategories() {
    Get.toNamed(Routes.categories);
    emailEditingController.clear();
    passworkEditingController.clear();
    passwordLevel.value = PasswordLevel.none;
  }

  void onPasswordChange(String? value) {
    if (value?.length == 0) {
      passwordLevel.value = PasswordLevel.none;
      return;
    }
    if (value!.length < 6) {
      passwordLevel.value = PasswordLevel.Short;
    } else {
      if (!value.isHaveLowerAndUpperCase() &&
          !value.isHaveNumber() &&
          !value.isHaveSpecialChar()) passwordLevel.value = PasswordLevel.Weak;
      if (value.isHaveLowerAndUpperCase())
        passwordLevel.value = PasswordLevel.Fair;
      if (value.isHaveNumber()) passwordLevel.value = PasswordLevel.Good;
      if (value.isHaveSpecialChar()) passwordLevel.value = PasswordLevel.Strong;
    }
  }

  bool _isValidate() {
    if (emailEditingController.text.trim().length == 0) {
      showSnackbar(message: 'Email is required', type: SnackbarType.error);
      return false;
    }

    if (!emailEditingController.text.trim().isEmail) {
      showSnackbar(message: 'Email is not valid', type: SnackbarType.error);
      return false;
    }

    if (passworkEditingController.text.trim().length == 0) {
      showSnackbar(message: 'Password is required', type: SnackbarType.error);
      return false;
    }

    if (passwordLevel.value == PasswordLevel.none ||
        passwordLevel.value == PasswordLevel.Short) {
      showSnackbar(message: 'Password is not valid', type: SnackbarType.error);
      return false;
    }

    if (!isAllowTermAndService.value) {
      showSnackbar(
          message: 'Please read term of services and privacy policy',
          type: SnackbarType.warning);
      return false;
    }

    return true;
  }

  void onChangeEmail(String? value) {}
}
