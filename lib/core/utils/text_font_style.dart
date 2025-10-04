import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFontStyle {
  //Initialising Constractor
  TextFontStyle._();

  static final headline16w500cFFFFFFStylePoppins = TextStyle(
    fontFamily: 'Poppins',
    fontFamilyFallback: const ['Montserrat', 'Poppins'],
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
}
