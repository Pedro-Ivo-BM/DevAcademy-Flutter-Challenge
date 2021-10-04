import 'package:get/get.dart';
import 'package:dev_challenge/view/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
