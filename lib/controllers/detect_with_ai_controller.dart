import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/models/detection_result_model.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:developer' as developer;

class DetectWithAiController extends GetxController {
  File? image;
  DetectionResultModel? detectionResult;
  bool isLoading = false;
  Interpreter? _interpreter;

  @override
  void onInit() {
    loadModel();
    super.onInit();
  }

  @override
  void onClose() {
    close();
    super.onClose();
  }

  Future<void> loadModel() async {
    try {
      final options = InterpreterOptions();
      _interpreter =
          await Interpreter.fromAsset(AppStrings.aiModel, options: options);
      developer
          .log('Input Tensor Shape: ${_interpreter?.getInputTensor(0).shape}');
      developer.log(
          'Output Tensor Shape: ${_interpreter?.getOutputTensor(0).shape}');
      developer.log('Model loaded successfully');
    } catch (e) {
      'Error loading model: $e'.showToast;
    }
  }

  pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      detectionResult = null;
      update();
    }
  }

  void detect() async {
    isLoading = true;
    update();
    if (image != null) {
      isLoading = true;
      update();
      await predictImage(image!);
      isLoading = false;
      update();
    } else {
      AppStrings.pleaseMakeSureThatYouHaveUploadedAnImageToast.showToast;
      isLoading = false;
      update();
    }
  }

  Future<void> predictImage(File imageFile) async {
    try {
      if (_interpreter == null) {
        throw Exception('Model not loaded');
      }

      img.Image? originalImage = img.decodeImage(await imageFile.readAsBytes());

      img.Image resizedImage =
          img.copyResize(originalImage!, width: 224, height: 224);

      List<List<List<List<double>>>> input = List.generate(
          1,
          (_) => List.generate(
              224,
              (y) => List.generate(224, (x) {
                    var pixel = resizedImage.getPixel(x, y);
                    return [
                      (pixel.r / 255.0),
                      (pixel.g / 255.0),
                      (pixel.b / 255.0)
                    ];
                  })));

      var output = List.filled(1 * 2, 0.0).reshape([1, 2]);

      _interpreter!.run(input, output);

      double benignProb = output[0][0];
      double melanomProb = output[0][1];
      bool isMelanoma = melanomProb > benignProb;
      detectionResult = DetectionResultModel(
        label: isMelanoma ? AppStrings.melanomaText : AppStrings.benignText,
        benignProb: benignProb * 100,
        melanomProb: melanomProb * 100,
        isMelanoma: melanomProb > benignProb,
      );
    } catch (e) {
      'Error during prediction: $e'.showToast;
    }
  }

  Future<void> close() async {
    _interpreter?.close();
  }
}
