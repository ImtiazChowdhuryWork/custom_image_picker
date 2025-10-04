import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePreview {
  static void show(BuildContext context, String imagePath) {
    if (imagePath.isEmpty || !File(imagePath).existsSync()) return;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54,
      pageBuilder: (_, __, ___) => Center(
        child: Container(
          width: 0.9.sw,
          height: 0.5.sh,
          padding: EdgeInsets.all(10.sp),
          color: Colors.white,
          child: InteractiveViewer(
            child: Image.file(File(imagePath), fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
