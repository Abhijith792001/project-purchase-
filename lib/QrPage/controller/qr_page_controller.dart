import 'dart:developer';
import 'package:get/get.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/routes/app_routes.dart';

class QrPageController extends GetxController {
  final scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
  );

  RxString scannedValue = ''.obs;
  RxBool isScanning = true.obs;

  /// Handles scan result from AiBarcodeScanner
  Future<void> onCodeDetected(BarcodeCapture capture) async {
    // Step 1: Check Camera Permission
    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      final result = await Permission.camera.request();
      if (!result.isGranted) {
        Get.snackbar(
          "Permission Denied",
          "Camera permission is required to scan QR",
        );
        return;
      }
    }

    // Step 2: Continue if permission granted
    final code = capture.barcodes.firstOrNull?.rawValue;

    if (code == null || !isScanning.value) return;

    scannedValue.value = code;
    isScanning.value = false;

    log("Scanned: $code");

    // Navigate directly to profile page with scanned QR value
    if (Get.context != null) {
      Get.offNamed(
        AppRoutes.profilePage,
        arguments: {'scannedValue': scannedValue.value},
      );
    } else {
      Get.snackbar("Error", "Unable to navigate to profile page");
      isScanning.value = true;
    }
  }

  @override
  void onClose() {
    scannerController.dispose();
    super.onClose();
  }
}
