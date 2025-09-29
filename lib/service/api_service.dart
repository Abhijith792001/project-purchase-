import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:project/service/common_interceptors.dart';

class ApiService {
  static const String baseUrl = ' https://mycampus.amrita.edu/api/method/';
  final Map<String, String> headers = {
    'Authorization': 'Token 7218b5303551b14:beb5459d640b721',
    'Content-Type': 'application/json',
  };

  late final Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    dio.interceptors.add(CustomInterceptors(headers: headers));
  }

  Future<Response> postApi(String endpoint, data) async {
    try {
      final response = await dio.post(
        endpoint,
        data: json.encode(data),
        options: Options(responseType: ResponseType.json),
      );

      if (response.data is String) {
        response.data = _parseResponse(response.data);
      }

      print("API Success: ${response.data}");
      return response;
    } on DioException catch (e) {
      print("API Error: ${e.message}");
      if (e.response != null) {
        print("Error Response: ${e.response?.data}");
      }
      rethrow;
    }
  }

  dynamic _parseResponse(String response) {
    try {
      return jsonDecode(response);
    } catch (e) {
      print("Failed to parse response: $e");
      return response;
    }
  }
}

// // import 'package:dio/dio.dart';
// // import 'package:get/get.dart' as get_pack;
// // import 'package:get/utils.dart';
// // import 'package:swagatham/service/common_interceptors.dart';

// // class ApiService {
// //   var headers = {

// //     "X-API-KEY": '5c8522e3b4674e8ea767c5dbabb127a6',
// //   };

// //   late Dio dio;
// //   ApiService() {
// //     dio = Dio();
// //     dio.interceptors.add(CustomInterceptors(headers: headers));
// //   }



// //   postApi(String value, Map<String, dynamic> data) async {
// //     try {
// //       Response response = await dio.post(
// //         'https://mobile-api.amrita.ac.in/swagatham/$value',
// //         data: data,
        
// //       );
// //       print(response);
// //      return response;
// //     } catch (e) {
// //       Get.snackbar('Error', "Api response is not working ${e.toString()}");
// //     }
// //   }
// // }



