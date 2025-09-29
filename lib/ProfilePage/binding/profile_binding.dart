import 'package:get/get.dart';
import 'package:project/ProfilePage/controller/profile_controller.dart';
import 'package:project/service/api_service.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ApiService());
    Get.put(ProfilePageController());
  }
}
