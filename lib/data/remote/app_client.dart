import 'dart:developer';

import 'package:flutter_nexle_test/app/app_constants.dart';
import 'package:flutter_nexle_test/app/app_pref.dart';
import 'package:flutter_nexle_test/setup_app.dart';
import 'package:get/get_connect.dart';

import '../../app/app_enums.dart';

class AppClient extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = null;
    httpClient.baseUrl = _getBaseUrl();
    httpClient.timeout = Duration(seconds: 30);
    httpClient.addAuthenticator<dynamic>((request) async {
      log('${request.method}: ${request.url}');
      var token = AppPref().getAccessToken();
      if (token != null && token != '')
        request.headers['Authorization'] = 'Bearer $token';
      return request;
    });
  }

  String _getBaseUrl() {
    switch (Enviroment.currentEnviroment) {
      case EnviromentType.production:
        return AppConstans.domainProd;
      case EnviromentType.staging:
        return AppConstans.domainStg;
      case EnviromentType.development:
      default:
        return AppConstans.domainDev;
    }
  }
}
