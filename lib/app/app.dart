import 'package:flutter/material.dart';
import 'package:flutter_nexle_test/app/app_bindings.dart';
import 'package:flutter_nexle_test/presentation/resources/routes.dart';
import 'package:flutter_nexle_test/presentation/resources/themes.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Test',
      initialRoute: Routes.signIn,
      getPages: Routes.pages,
      theme: getApplicationTheme(),
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}
