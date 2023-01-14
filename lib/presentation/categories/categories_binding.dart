import 'package:flutter_nexle_test/presentation/categories/categories_view_model.dart';
import 'package:get/get.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() => Get.put<CategoriesViewModel>(CategoriesViewModel());
}
