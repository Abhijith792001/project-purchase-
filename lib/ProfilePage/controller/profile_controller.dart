import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as appDio;
import 'package:project/ProfilePage/model/convocation_model.dart';
import 'package:project/service/api_service.dart';
import 'package:project/utils/storage_manger.dart';

class ProfilePageController extends GetxController {
  final ApiService apiService = ApiService();
  final StorageManger appStorage = StorageManger();

  var studentData = Rxn<StudentResponse>();
  var isLoading = false.obs;
  RxString scannedValue = ''.obs;
  RxString userRole = "".obs;
  RxString btnTxt = ''.obs;

  @override
  void onInit() {
    super.onInit();
    scannedValue.value = Get.arguments['scannedValue'];
    fetchStudent(scannedValue.value);
    // arguments: {'scannedValue': scannedValue.value},
    _loadUser();
  }

  Future<void> _loadUser() async {
    final _role = await appStorage.read('role');

    switch (_role) {
      case 'Gate':
        userRole.value = "1";
        btnTxt.value = "Mark as in";
        break;
      case 'Teacher':
        userRole.value = "2";
        break;
      case 'Warden':
        userRole.value = "3";
        btnTxt.value = "Mark as Collected";
        break;
    }
  }

  Future<void> fetchStudent(String value) async {
    final payLoad = {"key": value};
    try {
      isLoading.value = true;

      appDio.Response response = await apiService.postApi(
        'get_student_details_cb',
        payLoad,
      );

      if (response.statusCode == 200) {
        studentData.value = StudentResponse.fromJson(response.data);
        log("Student data: ${studentData.value?.toJson()}");
      } else {
        log("Unexpected status: ${response.statusCode}");
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

  Future<void> studentReporting(String value) async {
    final payLoad = {"key": value};

    try {
      isLoading.value = true;

      final response = await apiService.postApi('report_changer_cb', payLoad);

      if (response.statusCode == 200) {
        log("Student report updated successfully");
        await fetchStudent(value); // refresh data
      } else {
        log("Unexpected status code: ${response.statusCode}");
        Get.snackbar("Error", "Unexpected response: ${response.statusCode}");
      }

      log("Response data: ${response.data}");
    } catch (e) {
      if (e is appDio.DioException) {
        log("Dio error: ${e.response?.data ?? e.message}");
        Get.snackbar("Error", e.message ?? "Network error occurred");
      } else {
        log("Unknown error: $e");
        Get.snackbar("Error", "Something went wrong");
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> dressCollection(String value) async {
    final payLoad = {"key": value};

    try {
      isLoading.value = true;

      final appDio.Response response = await apiService.postApi(
        'collection_status_cb',
        payLoad,
      );

      if (response.statusCode == 200) {
        log("Collection status updated successfully");
        await fetchStudent(value); // Await ensures proper sequence
      } else {
        log("Unexpected status code: ${response.statusCode}");
        Get.snackbar("Error", "Unexpected response: ${response.statusCode}");
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

  Future<void> buttonFunction() async {
    if (userRole.value == '1') {
      await studentReporting(scannedValue.value);
    } else if (userRole.value == '3' ) {
      await dressCollection(scannedValue.value);
    } else {
      Get.snackbar("Error", "Invalid user role: ${userRole.value}");
    }
  }
}
