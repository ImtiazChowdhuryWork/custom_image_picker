import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  RxString pickedImagePath = ''.obs;

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxHeight: 1024,
        maxWidth: 1024,
      );
      if (image != null) {
        pickedImagePath.value = image.path;
      } else {
        Get.snackbar('Cancelled', 'No image selected');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  void clearImage() => pickedImagePath.value = '';

  File? get imageFile =>
      pickedImagePath.value.isNotEmpty ? File(pickedImagePath.value) : null;
}
