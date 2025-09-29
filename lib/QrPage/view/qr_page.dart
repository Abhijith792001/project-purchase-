import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project/QrPage/controller/qr_page_controller.dart';
import 'package:project/routes/app_routes.dart';

class QrPage extends StatelessWidget {
  QrPage({super.key});

  final controller = Get.put(QrPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [Icon(LucideIcons.ellipsisVertical600,color: Colors.white,),SizedBox(width: 10.w,)],
        leading: InkWell(
          onTap: () {
              Get.offAllNamed(AppRoutes.homePage);
          },
          child: Icon(LucideIcons.x600,color: Colors.white,),
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text("Student Scanner",style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.transparent,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) {
            Get.offAllNamed(AppRoutes.homePage);
          }
        },
        child: Stack(
          children: [
            AiBarcodeScanner(
              controller: controller.scannerController,
              onDetect: controller.onCodeDetected,
              onScan: (_) {}, // Required but not used
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment(0.00, 0.50),
                    end: Alignment(1.00, 0.50),
                    colors: [Color(0xFFA4123F), Color(0xFFFC5286)],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scan QR code to get student',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Quickly and get your student.',
                      style: TextStyle(fontSize: 10.sp, color: Colors.white),
                    ),
                    Divider(thickness: 0.5, color: Colors.white54),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
