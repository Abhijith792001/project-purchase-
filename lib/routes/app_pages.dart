import 'package:get/get.dart';
import 'package:project/Authentication/binding/auth_binding.dart';
import 'package:project/Authentication/view/login_page.dart';
import 'package:project/Pages/HomePage/binding/home_binding.dart';
import 'package:project/Pages/HomePage/view/home_page.dart';
import 'package:project/Pages/IndentPage/binding/indent_binding.dart';
import 'package:project/Pages/IndentPage/view/indent_page.dart';
import 'package:project/Pages/QrPage/binding/qr_binding.dart';
import 'package:project/Pages/QrPage/view/qr_page.dart';
import 'package:project/Pages/SplashPage/binding/splash_binding.dart';
import 'package:project/Pages/SplashPage/view/splash_page.dart';
import 'package:project/routes/app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.indentPage,
      page: () => IndentPage(),
      binding: IndentBinding(),
    ),
    GetPage(
      name: AppRoutes.qrPage,
      page: () => QrPage(),
      binding: QrBinding(),
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    
    GetPage(
      name: AppRoutes.splashPage,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    
  ];
}
