import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:tflite/tflite.dart';

class DetectWithAiController extends GetxController {
  File? image;
  bool isLoading = false;
  List? outputList = [];

  @override
  onInit() {
    super.onInit();
    loadModel();
  }

  pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }

  void loadModel() async {
    await Tflite.loadModel(
      model: AppStrings.aiModelAsset,
      labels: AppStrings.aiLabelsAsset,
    );
  }

  void detect() async {
    isLoading = true;
    update();
    if (image != null) {
      List? output = await Tflite.runModelOnImage(
        path: image!.path,
        numResults: 2,
        threshold: 0.5,
        imageStd: 127.5,
        imageMean: 127.5,
      );
      outputList = output;
      isLoading = false;
      update();
    } else {
      AppStrings.pleaseMakeSureThatYouHaveUploadedAnImageToast.showToast;
      isLoading = false;
      update();
    }
  }
}
