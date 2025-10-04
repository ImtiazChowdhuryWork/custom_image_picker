import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/custom_image_picker_controller.dart';
import '../../core/utils/image_picker_handler.dart';
import '../../core/widget/custom_image_picker_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final CustomImagePickerController imageController = Get.put(
    CustomImagePickerController(),
    tag: 'mainScreen',
  );

  final ImagePickerHandler pickerHandler = ImagePickerHandler(
    Get.find<CustomImagePickerController>(tag: 'mainScreen'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateless Image Picker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImagePickerWidget(
              controller: imageController,
              handler: pickerHandler,
              defaultImagePath: "assets/images/profile_avatar.png",
              editIconPath: "assets/icons/camera_icon.svg",
              shapeHeight: 150,
              shapeWidth: 150,
            ),
            const SizedBox(height: 20),
            Obx(() {
              return Text(
                'Picked Image: ${imageController.pickedImagePath.value.isEmpty ? "None" : imageController.pickedImagePath.value}',
                textAlign: TextAlign.center,
              );
            }),
          ],
        ),
      ),
    );
  }
}
