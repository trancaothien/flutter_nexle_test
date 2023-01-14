import 'package:flutter/material.dart';
import 'package:flutter_nexle_test/app/app.dart';
import 'package:flutter_nexle_test/setup_app.dart';

import 'app/app_enums.dart';

void main() async {
  await setUpApp(EnviromentType.staging);
  runApp(const App());
}
