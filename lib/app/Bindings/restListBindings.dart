import 'package:get/get.dart';

import '../../Controller/ResturantListController.dart';

//Ward khadour
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ResturantListController());
  }
}
