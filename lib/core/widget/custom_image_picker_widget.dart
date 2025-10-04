import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/custom_image_picker_controller.dart';
import '../utils/image_picker_handler.dart';
import '../utils/image_preview.dart';

class CustomImagePickerWidget extends StatelessWidget {
  final CustomImagePickerController controller;
  final ImagePickerHandler handler;
  final String defaultImagePath;
  final String editIconPath;
  final double shapeHeight;
  final double shapeWidth;
  final BoxShape shape;
  final bool enablePreview;

  const CustomImagePickerWidget({
    super.key,
    required this.controller,
    required this.handler,
    required this.defaultImagePath,
    required this.editIconPath,
    this.shapeHeight = 120,
    this.shapeWidth = 120,
    this.shape = BoxShape.circle,
    this.enablePreview = true,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final imagePath = controller.pickedImagePath.value;
      final hasImage = imagePath.isNotEmpty && File(imagePath).existsSync();

      return GestureDetector(
        onTap: () {
          if (enablePreview && hasImage) {
            ImagePreview.show(context, imagePath);
          } else {
            handler.showPickerDialog(context);
          }
        },
        child: Container(
          height: shapeHeight,
          width: shapeWidth,
          decoration: BoxDecoration(
            shape: shape,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: hasImage
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
                  onTap: () => handler.showPickerDialog(context),
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
