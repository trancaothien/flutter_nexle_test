import 'package:flutter_nexle_test/data/remote/app_client.dart';
import 'package:flutter_nexle_test/data/repositories/repository_impl.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppClient());
    Get.put(RepositoryImpl(httpClient: Get.find<AppClient>().httpClient));
  }
}
