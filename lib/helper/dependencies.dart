import 'package:get/get.dart';
import 'package:tikum_mobile/controllers/popular_product_controller.dart';
import 'package:tikum_mobile/data/api/api_client.dart';
import 'package:tikum_mobile/data/repository/popular_product_repo.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.dbestech.com"));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find(), apiClient: Get.find()));
}
