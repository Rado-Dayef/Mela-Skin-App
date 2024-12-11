import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mela_skin/constants/colors.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/controllers/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  AppStrings.appName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  AppStrings.appSlogan,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.darkBlueColor.withOpacity(0.8),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: AppColors.whiteColor,
        padding: 15.edgeInsetsVertical,
        child: 30.blueLoading,
      ),
    );
  }
}
