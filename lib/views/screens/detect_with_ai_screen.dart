import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mela_skin/constants/colors.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/controllers/detect_with_ai_controller.dart';

class DetectWithAiScreen extends GetWidget<DetectWithAiController> {
  const DetectWithAiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: Get.back,
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        titleSpacing: 5,
        title: Text(
          AppStrings.detectWithAIText,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.whiteColor,
              ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: 15.borderRadiusTop,
          ),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: 10.edgeInsetsAll,
            child: Column(
              children: [
                InkWell(
                  onTap: controller.pickImage,
                  child: GetBuilder<DetectWithAiController>(
                    builder: (_) {
                      return Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.darkBlueColor,
                          borderRadius: 15.borderRadiusAll,
                        ),
                        alignment: Alignment.center,
                        child: controller.image != null
                            ? ClipRRect(
                                borderRadius: 15.borderRadiusAll,
                                child: SizedBox(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Image.file(controller.image!, fit: BoxFit.cover),
                                ),
                              )
                            : Text(
                                AppStrings.uploadImageText,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                              ),
                      );
                    },
                  ),
                ),
                25.gap,
                InkWell(
                  onTap: controller.detect,
                  child: Container(
                    padding: 10.edgeInsetsAll,
                    decoration: BoxDecoration(
                      color: AppColors.darkBlueColor,
                      borderRadius: 15.borderRadiusAll,
                    ),
                    alignment: Alignment.center,
                    child: GetBuilder<DetectWithAiController>(
                      builder: (_) {
                        return controller.isLoading
                            ? 25.whiteLoading
                            : Text(
                                AppStrings.detectText,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
