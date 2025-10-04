import 'package:custom_image_picker/features/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const CustomImagePickerApp());
}

class CustomImagePickerApp extends StatelessWidget {
  const CustomImagePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Custom Image Picker Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: MainScreen(),
        );
      },
    );
  }
}
