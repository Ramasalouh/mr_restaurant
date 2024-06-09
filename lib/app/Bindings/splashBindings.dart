import 'package:get/get.dart';

import '../../Controller/SplashController.dart';
//Aya Ahmad

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SlashController());
  }
}
