import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project/routes/app_routes.dart';
import 'package:project/utils/storage_manger.dart';


class SplashController extends GetxController {
  StorageManger appStorage = StorageManger();

  String? isLoggedIn = '';

  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  void _initializeApp() async {
    try {
  
      FlutterNativeSplash.remove();


      await Future.delayed(const Duration(seconds: 2));

      // Navigate to Home Page
      isLoggedIn = await appStorage.read('isLoggedIn');
     
      if (isLoggedIn == "true") {
        Get.offAllNamed(AppRoutes.homePage);
      } else {
        Get.offAllNamed(AppRoutes.loginPage);
      }
    } catch (e) {
      print('Error during initialization: $e');
    }
  }
}
