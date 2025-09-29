import 'package:get/get.dart';
import 'package:project/Pages/HomePage/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeController());
  }
}
