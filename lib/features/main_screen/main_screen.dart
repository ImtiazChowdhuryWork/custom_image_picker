import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/controllers/custom_image_picker_controller.dart';
import '../../core/utils/image_picker_handler.dart';
import '../../core/widget/custom_image_picker_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final CustomImagePickerController imageController;
  late final ImagePickerHandler pickerHandler;

  @override
  void initState() {
    super.initState();
    imageController = Get.put(CustomImagePickerController(), tag: 'mainScreen');
    pickerHandler = ImagePickerHandler(imageController);
  }

  @override
  void dispose() {
    Get.delete<CustomImagePickerController>(tag: 'mainScreen');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Screen'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImagePickerWidget(
              controller: imageController,
              handler: pickerHandler,
              defaultImagePath: 'assets/images/profile_avatar.png',
              editIconPath: 'assets/icons/camera_icon.svg',
              shapeHeight: 150.h,
              shapeWidth: 150.w,
            ),
            SizedBox(height: 30.h),
            Obx(() {
              return Text(
                'Picked Image Path: ${imageController.pickedImagePath.value.isEmpty ? "None" : imageController.pickedImagePath.value}',
                textAlign: TextAlign.center,
              );
            }),
          ],
        ),
      ),
    );
  }
}
