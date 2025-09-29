import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xffd4145a), Color(0xffa4123f)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static final BoxShadow primaryShadow = BoxShadow(
    color: Colors.grey.shade400,
    blurRadius: 4,
    offset: Offset(0, 0),
  );

  static const Color primaryColor = Color(0xffa4123f);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Color(0xff222222);
  static const Color secondaryColor = Color(0xffffeeee);
  static const Color grayColor = Color(0xff737373);
  static const Color grayLightColor = Color.fromARGB(255, 245, 245, 245);
  static const Color successColor = Color(0xff45BA70);
  static const Color pendingColor = Color(0xffF3C200);
  static const Color dangerColor = Color(0xFFFF3B30);
  static const Color shadowColor = Color(0xFFCAC9C9);
}
