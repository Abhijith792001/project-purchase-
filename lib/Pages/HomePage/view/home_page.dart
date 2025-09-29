import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project/Pages/HomePage/controller/home_controller.dart';
import 'package:project/routes/app_routes.dart';
import 'package:project/widgets/primary_btn.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   // child: Chip(
      //   //   backgroundColor: Colors.grey.shade100,
      //   //   avatar: Icon(Icons.help_outline, size: 18),
      //   //   label: Text('May I Help You?'),
      //   // ),
      // ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xffa4123f)),
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icon(LucideIcons.alignLeft, color: Colors.white),
                    Image.asset(
                      'assets/images/amrita_logo_white.png',
                      width: 100,
                    ),
                    InkWell(
                      onTap: () {
                        controller.logOut();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.white10,
                        ),
                        child: Icon(LucideIcons.logOut, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                width: Get.width,

                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.sp),
                    topRight: Radius.circular(32.sp),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50.h),
                      Image.asset('assets/images/home_img.png', width: 250),
                      SizedBox(height: 20.h),
                      Text(
                        'Purchase Indent 2025',
                        style: TextStyle(
                          fontSize: 16.87.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                     "Register purchase requests and trackapprovals easily. \nView item details, approval status, and key \ninformation instantly.A fast, simple, and \nefficient way to manage purchases \non the go.",
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => {
                              Get.toNamed(AppRoutes.qrPage)
                            },
                            child: PrimaryBtn(btnText: "Scan the Indent"),
                          ),
                          SizedBox(height: 15.h),
                          InkWell(
                            onTap: () {
                              // Get.toNamed(AppRoutes.instructionPage);
                            },
                            child: Chip(
                              backgroundColor: Colors.grey.shade100,
                              avatar: Icon(LucideIcons.searchCode, size: 18),
                              label: Text('Manual Searching'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
