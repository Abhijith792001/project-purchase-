import 'package:get/get.dart';
import 'package:project/Pages/QrPage/controller/qr_page_controller.dart';
import 'package:project/service/api_service.dart';


class QrBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
        Get.lazyPut(() => ApiService(), fenix: true);
    Get.lazyPut(() => QrPageController(), fenix: true);
  }
}