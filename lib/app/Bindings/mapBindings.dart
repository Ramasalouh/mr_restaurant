import 'package:get/get.dart';

import '../../Controller/MapController.dart';
 //Anas Abdullah
class MapBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MapController());
  }
}
