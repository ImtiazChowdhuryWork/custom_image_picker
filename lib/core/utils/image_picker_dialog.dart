import 'package:custom_image_picker/core/utils/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showImagePickerDialog({
  required VoidCallback onCameraTap,
  required VoidCallback onGalleryTap,
}) {
  Get.dialog(
    Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 0.8.sw,
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: const Color(0xFF3C3C3C),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: onCameraTap,
                leading: SvgPicture.asset(
                  "assets/icons/camera_icon_without_bg.svg",
                  colorFilter: const ColorFilter.mode(
                    Colors.white, // previously AppColors.cFFFFFF
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  "Camera",
                  style: TextFontStyle.headline16w500cFFFFFFStylePoppins,
                ),
              ),
              ListTile(
                onTap: onGalleryTap,
                leading: const Icon(
                  Icons.collections_rounded,
                  color: Colors.white, // previously AppColors.cFFFFFF
                ),
                title: Text(
                  "Gallery",
                  style: TextFontStyle.headline16w500cFFFFFFStylePoppins,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
