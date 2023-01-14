import 'package:flutter_nexle_test/app/app_enums.dart';
import 'package:flutter_nexle_test/app/app_pref.dart';
import 'package:flutter_nexle_test/data/model/category_model.dart';
import 'package:flutter_nexle_test/data/repositories/repository_impl.dart';
import 'package:flutter_nexle_test/presentation/base/base_view_model.dart';
import 'package:get/get.dart';

class CategoriesViewModel extends BaseViewModel {
  // Rx
  final categories = <CategoryModel>[].obs;
  final selectedCategories = <String>[].obs;

  // repo
  final repo = Get.find<RepositoryImpl>();

  @override
  void onReady() async {
    super.onReady();
    await _getCategories();
  }

  void onBackScreen() => Get.back();

  Future _getCategories() async {
    setLoading(true);
    var response = await repo.categories();
    if (response.success!) {
      categories.value = response.data?.categories ?? [];
    }
    setLoading(false);
  }

  void onPressedCategory(String id) {
    if (selectedCategories.contains(id)) {
      selectedCategories.remove(id);
    } else {
      selectedCategories.add(id);
    }
  }

  void onDone() async {
    if (selectedCategories.length == 0) {
      showSnackbar(
          message: 'Please Please select at least one category',
          type: SnackbarType.warning);
    } else {
      AppPref()..setCategories(selectedCategories);
      showSnackbar(message: 'Categories is saved', type: SnackbarType.success);
    }
  }
}
