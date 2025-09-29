import 'package:get/get.dart';
import 'package:project/Pages/HomePage/view/home_page.dart';
import 'package:project/routes/app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: AppRoutes.homePage, page: () => HomePage()),
  ];
}
