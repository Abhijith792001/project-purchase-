import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as appDio;
import 'package:lottie/lottie.dart';
import 'package:project/Pages/IndentPage/model/indent_model.dart';
import 'package:project/routes/app_routes.dart';
import 'package:project/service/api_service.dart';
import 'package:project/theme/app_theme.dart';
import 'package:project/utils/storage_manger.dart';

class IndentController extends GetxController {
  final ApiService apiService = ApiService();
  final StorageManger appStorage = StorageManger();

  var indentData = Rxn<IndentModel>(); // ✅ fixed
  var isLoading = false.obs;
  RxString scannedValue = ''.obs;
  RxString userRole = "".obs;
  RxString btnTxt = ''.obs;
  RxString statusUpdate = ''.obs;
  RxString userMail = ''.obs;

  @override
  void onInit() {
    super.onInit();
    scannedValue.value = Get.arguments['scannedValue'];
    getIndentDetails(scannedValue.value);
    mailGetting();
  }

  mailGetting() async {
    userMail.value = await appStorage.read('userEmail');
    print('mail of user ${userMail.value}');
  }

  Future<void> getIndentDetails(String indentId) async {
    final payLoad = {
      "id": indentId, // ✅ fixed
    };

    isLoading.value = true;
    try {
      final response = await apiService.postApi('get_indent', payLoad);
      print("response.data ${response.data}");

      if (response.data['indent_data'] != null) {
        indentData.value = IndentModel.fromJson(response.data['indent_data']);
        print("Indent ID: ${indentData.value!.indentId.toString()}");
        log('statusUpdate ${indentData.value!.indentStatus.toString()}');
      } else {
        print("No indent data found");
      }
    } catch (e) {
      if (e is appDio.DioException) {
        log("Dio error: ${e.response?.data ?? e.message}");
        Get.snackbar("Error", e.message ?? "Something went wrong");
      } else {
        log("Unknown error: $e");
        Get.snackbar("Error", e.toString());
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> buttonSubmit(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // can't close by tapping outside
      builder: (context) {
        // Auto close after 2 sec
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
          Get.offAllNamed(AppRoutes.homePage);
        });

        return Dialog(
          backgroundColor: AppTheme.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ✅ Animated success tick
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Lottie.asset(
                    'assets/success_tick.json',
                    repeat: false,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Success!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> registerIn(String indentId) async {
    final payLoad = {"id": indentId, "status_update": "Registrar In"};
    isLoading.value = true;

    try {
      appDio.Response response = await apiService.postApi(
        'set_indent_status_registrar',
        payLoad,
      );
      if (response.statusCode == 200) {
        print('Registrar update successful for');
      } else {
        print("⚠️ Unexpected response: ");
      }
    } catch (e) {
      print("❌ Unexpected error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> afterRegisterIn(String indentId, String status) async {
    final payLoad = {"id": indentId, "status_update": status};
    isLoading.value = true;

    try {
      appDio.Response response = await apiService.postApi(
        'set_indent_status_registrar',
        payLoad,
      );
      if (response.statusCode == 200) {
        print('Registrar update successful for');
      } else {
        print("⚠️ Unexpected response: ");
      }
    } catch (e) {
      print("❌ Unexpected error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
