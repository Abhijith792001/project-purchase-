// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';
// import 'package:swagatham/routes/app_routes.dart';
// import 'package:swagatham/widgets/primary_btn.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.white,
//         // child: Chip(
//         //   backgroundColor: Colors.grey.shade100,
//         //   avatar: Icon(Icons.help_outline, size: 18),
//         //   label: Text('May I Help You?'),
//         // ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(color: Color(0xffa4123f)),
//         child: Column(
//           children: [
//             SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.sp),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Icon(LucideIcons.info, color: Colors.white),

//                     Image.asset(
//                       'assets/images/amrita_logo_white.png',
//                       width: 120,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 50.h),
//             Expanded(
//               child: Container(
//                 width: Get.width,
//                 padding: EdgeInsets.symmetric(horizontal: 16.sp),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(32.sp),
//                     topRight: Radius.circular(32.sp),
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 100.h),
//                       Text(
//                         "Welcome Back 👋",
//                         style: TextStyle(
//                           fontSize: 24.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: 8.h),
//                       Text(
//                         "Login to your Amrita Staff account",
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           color: Colors.grey.shade600,
//                         ),
//                       ),
//                       SizedBox(height: 40.h),

//                       // Email TextField
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(16.r),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 6,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 16.w,
//                             ),
//                             border: InputBorder.none,
//                             hintText: 'Email',
//                             icon: Padding(
//                               padding: EdgeInsets.only(left: 12.w),
//                               child: Icon(LucideIcons.mail),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.h),

//                       // Password TextField
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(16.r),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 6,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: TextField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 16.w,
//                             ),
//                             border: InputBorder.none,
//                             hintText: 'Password',
//                             icon: Padding(
//                               padding: EdgeInsets.only(left: 12.w),
//                               child: Icon(LucideIcons.lock),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30.h),

//                       // Login Button
//                       GestureDetector(
//                         onTap: () {
//                           Get.offAllNamed(AppRoutes.homePage);
//                         }, // Add your login logic here
//                         child: Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.symmetric(vertical: 10.h),
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [Color(0xffd4145a), Color(0xffa4123f)],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.circular(16.r),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black26,
//                                 blurRadius: 5,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           alignment: Alignment.center,
//                           child: Text(
//                             'Login',
//                             style: TextStyle(
//                               fontSize: 16.sp,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.h),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
