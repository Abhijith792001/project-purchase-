// import 'package:get/get.dart';


// class HomeController extends GetxController {
//   StorageManger appStorage = StorageManger();
//   RxString buttonText = ''.obs;
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     scannerButtonText();
//   }

//   logOut() {

    
//     appStorage.deleteAll();
//     if(Get.isRegistered<QrController>()){
//       Get.find<QrController>().userData.value = null;
//     }
//     Get.offAllNamed(AppRoutes.loginPage);
//     Get.snackbar('Logout', 'Logout succesfully');
//   }

//   scannerButtonText() async {
//     final _role = await appStorage.read('role');
//     // final _role = 'Gate';
//     if (_role != null && _role == 'Gate') {
//       return buttonText.value = 'Gate Pass Scan';
//     } else if (_role != null && _role == 'Warden') {
//       return buttonText.value = 'Hostel Pass Scan';
//     } else if (_role != null && _role == 'Teacher') {
//       return buttonText.value = 'Document Scan';
//     } else {
//       return buttonText.value = 'Scan';
//     }
//   }
// }
