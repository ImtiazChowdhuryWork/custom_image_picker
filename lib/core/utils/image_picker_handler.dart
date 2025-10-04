import 'package:custom_image_picker/core/utils/image_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/custom_image_picker_controller.dart';

class ImagePickerHandler {
  final CustomImagePickerController controller;

  ImagePickerHandler(this.controller);

  void showPickerDialog(BuildContext context) {
    showImagePickerDialog(
      onCameraTap: () {
        Get.back();
        controller.pickImage(ImageSource.camera);
      },
      onGalleryTap: () {
        Get.back();
        controller.pickImage(ImageSource.gallery);
      },
    );
  }
}
