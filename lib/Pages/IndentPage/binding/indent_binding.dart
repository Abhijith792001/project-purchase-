import 'package:get/get.dart';
import 'package:project/Pages/IndentPage/controller/indent_controller.dart';
import 'package:project/service/api_service.dart';


class IndentBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ApiService());
    Get.put(IndentController());
  }
}
