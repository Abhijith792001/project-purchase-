import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project/theme/app_theme.dart';

class DoneBtn extends StatelessWidget {
   DoneBtn({super.key, required this.btnText});
  final String btnText ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LucideIcons.circleCheck, color: Colors.white),
          SizedBox(width: 10.w),
          Text(
            btnText,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
