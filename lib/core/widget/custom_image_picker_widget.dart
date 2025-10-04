import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../controllers/custom_image_picker_controller.dart';
import 'package:get/get.dart';

import '../utils/image_picker_dialog.dart';
import '../utils/image_picker_handler.dart';

class CustomImagePickerWidget extends StatelessWidget {
  final CustomImagePickerController controller;
  final ImagePickerHandler handler;
  final String defaultImagePath;
  final String editIconPath;
  final double shapeHeight;
  final double shapeWidth;

  const CustomImagePickerWidget({
    super.key,
    required this.controller,
    required this.handler,
    required this.defaultImagePath,
    required this.editIconPath,
    required this.shapeHeight,
    required this.shapeWidth,
  });

  void _handlePickImage(BuildContext context) {
    showImagePickerDialog(
      onCameraTap: () {
        Get.back();
        handler.pickFromCamera();
      },
      onGalleryTap: () {
        Get.back();
        handler.pickFromGallery();
      },
    );
  }

  void _showPreview(BuildContext context, String imagePath) {
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

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final imagePath = controller.pickedImagePath.value;
      return InkWell(
        onTap: () =>
            imagePath.isNotEmpty ? _showPreview(context, imagePath) : null,
        child: Container(
          height: shapeHeight,
          width: shapeWidth,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imagePath.isNotEmpty
                  ? FileImage(File(imagePath))
                  : AssetImage(defaultImagePath) as ImageProvider,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 5.h,
                right: 5.w,
                child: InkWell(
                  onTap: () => _handlePickImage(context),
                  child: SvgPicture.asset(editIconPath),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
