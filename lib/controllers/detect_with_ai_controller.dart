import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';

class DetectWithAiController extends GetxController {
  File? image;
  bool isLoading = false;

  pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }

  void detect() async {
    isLoading = true;
    update();
    if (image != null) {
      isLoading = true;
      update();
    } else {
      AppStrings.pleaseMakeSureThatYouHaveUploadedAnImageToast.showToast;
      isLoading = false;
      update();
    }
  }
}
