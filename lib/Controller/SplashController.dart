import 'package:get/get.dart';

import '../View/Screens/HomePage.dart';
 
//May Ibrahim

class SlashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(HomePage.routeName);
    super.onInit();
  }
}
