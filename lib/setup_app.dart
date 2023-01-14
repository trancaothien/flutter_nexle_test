import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nexle_test/app/app_enums.dart';
import 'package:flutter_nexle_test/app/app_pref.dart';

class Enviroment {
  static EnviromentType? currentEnviroment;
}

Future setUpApp(EnviromentType env) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  await AppPref().init();
  Enviroment.currentEnviroment = env;
}
