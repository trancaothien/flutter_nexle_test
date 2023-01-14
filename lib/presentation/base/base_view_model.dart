import 'package:flutter/material.dart';
import 'package:flutter_nexle_test/app/app_enums.dart';
import 'package:flutter_nexle_test/presentation/resources/colors.dart';
import 'package:flutter_nexle_test/presentation/resources/fonts.dart';
import 'package:flutter_nexle_test/presentation/resources/values.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends GetxController {
  final loadingSubject = BehaviorSubject<bool>.seeded(false);

  void setLoading(bool loading) {
    if (loading != isLoading) loadingSubject.add(loading);
  }

  bool get isLoading => loadingSubject.value;

  void unFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void showSnackbar({
    required String message,
    required SnackbarType type,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        borderRadius: AppRadius.r8,
        margin: EdgeInsets.all(AppMargin.m18),
        titleText: Text(
          type == SnackbarType.error
              ? 'Error'
              : type == SnackbarType.warning
                  ? 'Warning'
                  : 'Success',
          style: TextStyle(
            fontSize: FontSizes.s18,
            color: type == SnackbarType.error
                ? ColorsManager.red
                : type == SnackbarType.warning
                    ? ColorsManager.orange
                    : ColorsManager.green,
          ),
        ),
        messageText: Text(
          message,
          style: TextStyle(
            fontSize: FontSizes.s16,
            color: ColorsManager.white,
          ),
        ),
      ),
    );
  }
}
