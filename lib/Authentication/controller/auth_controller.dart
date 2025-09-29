import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as appDio;
import 'package:project/routes/app_routes.dart';
import 'package:project/service/api_service.dart';
import 'package:project/utils/storage_manger.dart';


class AuthController extends GetxController {
  final ApiService apiService = ApiService();
  final StorageManger appStorage = StorageManger();

  final RxString currentUser = ''.obs;
  final RxBool isLoading = false.obs;
  final RxString isLoggedIn = ''.obs;

  Future<void> login(String email, String password) async {
    final payLoad = {'login_name': email, 'password': password};

    try {
      isLoading.value = true;

      

      final appDio.Response? response = await apiService.postApi('login', payLoad);


      if (response != null && response.statusCode == 200) {
        final userData = response.data;

        // final loginData = LoginResponseModel.fromJson(userData);

        // await appStorage.write('role', loginData.role.role);

        
        // Optional: Save user data if needed
         await appStorage.write('isLoggedIn', 'true');

        await appStorage.write('userData', jsonEncode(userData));

        // await appStorage.write('role', value)

        // isLoggedIn.value =  await appStorage.read('isLoggedIn');

        Get.offAllNamed(AppRoutes.homePage);

        Get.snackbar(
          'Success',
          'Login Successful',
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
