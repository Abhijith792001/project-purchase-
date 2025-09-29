import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as appDio;
import 'package:project/Authentication/model/login_model.dart';
import 'package:project/routes/app_routes.dart';
import 'package:project/service/api_service.dart';
import 'package:project/utils/storage_manger.dart';

class AuthController extends GetxController {
  final ApiService apiService = ApiService();
  final StorageManger appStorage = StorageManger();

  final RxString currentUser = ''.obs;
  final RxBool isLoading = false.obs;
  final RxString isLoggedIn = ''.obs;

  var loginData = Rxn<LoginModel>(); // ✅ fixed

  Future<void> login(String email, String password) async {
    final payLoad = {'usr': email, 'pwd': password};

    try {
      isLoading.value = true;

      final appDio.Response? response = await apiService.postApi('login', payLoad);

      if (response != null && response.statusCode == 200) {
        final userData = response.data;

        // ✅ parse json into model
        loginData.value = LoginModel.fromJson(userData);

        // ✅ save in storage
        await appStorage.write('isLoggedIn', 'true');
        await appStorage.write('userEmail', email);
        await appStorage.write('userData', jsonEncode(userData));
        await appStorage.write('fullName', loginData.value?.fullName ?? "");
        await appStorage.write('homePage', loginData.value?.homePage ?? "");

        // update state
        currentUser.value = loginData.value?.fullName ?? "";
        isLoggedIn.value = 'true';

        Get.offAllNamed(AppRoutes.homePage);

        Get.snackbar(
          'Success',
          'Welcome ${loginData.value?.fullName ?? "User"}!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.shade600,
          colorText: Colors.white,
        );

        print("✅ Login successful: $userData");

      } else {
        Get.snackbar(
          'Login Failed',
          'Invalid email or password.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade600,
          colorText: Colors.white,
        );
        print("❌ Invalid credentials or server error.");
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
      );
      print("❌ API exception: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
