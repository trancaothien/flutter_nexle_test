import 'package:flutter/material.dart';
import 'package:flutter_nexle_test/app/app.dart';
import 'package:flutter_nexle_test/app/app_enums.dart';
import 'package:flutter_nexle_test/setup_app.dart';

void main() async {
  await setUpApp(EnviromentType.production);
  runApp(const App());
}
