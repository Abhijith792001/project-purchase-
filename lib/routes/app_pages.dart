import 'package:get/get.dart';
import 'package:project/Pages/HomePage/binding/home_binding.dart';
import 'package:project/Pages/HomePage/view/home_page.dart';
import 'package:project/ProfilePage/binding/profile_binding.dart';
import 'package:project/ProfilePage/view/profile_page.dart';
import 'package:project/routes/app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.profilePage,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
