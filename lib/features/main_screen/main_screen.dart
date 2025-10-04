import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/controllers/custom_image_picker_controller.dart';
import '../../core/utils/image_picker_handler.dart';
import '../../core/widget/custom_image_picker_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final CustomImagePickerController imageController = Get.put(
    CustomImagePickerController(),
    tag: 'mainScreen',
  );

  late final ImagePickerHandler pickerHandler = ImagePickerHandler(
    imageController,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Reusable Image Picker"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: CustomImagePickerWidget(
              controller: imageController,
              handler: pickerHandler,
              defaultImagePath: 'assets/images/profile_avatar.png',
              editIconPath: 'assets/icons/camera_icon.svg',
              shapeHeight: 120.h,
              shapeWidth: 120.w,
            ),
          ),
          SizedBox(height: 40.h),

          /// 🖼️ Show Selected Image Below
          Obx(() {
            final imagePath = imageController.pickedImagePath.value;
            if (imagePath.isEmpty || !File(imagePath).existsSync()) {
              return Text(
                "No image selected yet.",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              );
            }

            return ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.file(
                File(imagePath),
                width: 200.w,
                height: 200.h,
                fit: BoxFit.cover,
              ),
            );
          }),
        ],
      ),
    );
  }
}
