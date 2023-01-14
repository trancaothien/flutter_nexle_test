import 'package:flutter_nexle_test/presentation/categories/categories_binding.dart';
import 'package:flutter_nexle_test/presentation/categories/categories_view.dart';
import 'package:flutter_nexle_test/presentation/sign_up/sign_up_binding.dart';
import 'package:flutter_nexle_test/presentation/sign_up/sign_up_view.dart';
import 'package:get/route_manager.dart';

class Routes {
  static const String init = '/';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String categories = '/categories';

  static List<GetPage<dynamic>> pages = <GetPage>[
    GetPage(
        name: signIn,
        page: () => const SignUpView(),
        binding: SignUpBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: categories,
        page: () => const CategoriesView(),
        binding: CategoriesBinding(),
        transition: Transition.rightToLeft),
  ];
}
