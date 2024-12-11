import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mela_skin/constants/colors.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/controllers/details_controller.dart';
import 'package:mela_skin/models/schedule_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends GetWidget<DetailsController> {
  const DetailsScreen({super.key});

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
          controller.user.name,
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
            child: controller.currentUser.role == AppStrings.doctorText
                ? GetBuilder<DetailsController>(
                    builder: (_) {
                      return controller.currentUser.patients.firstWhere((patient) => patient.email == controller.user.email).isAccepted == 0
                          ? Column(
                              children: [
                                Text(
                                  controller.currentUser.patients.firstWhere((patient) => patient.email == controller.user.email).time,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: AppColors.darkBlueColor,
                                      ),
                                ),
                                Text(
                                  AppStrings.bookedAtText + AppStrings.colonSign + AppStrings.spaceSign + controller.currentUser.patients.firstWhere((patient) => patient.email == controller.user.email).date,
                                ),
                                25.gap,
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: InkWell(
                                        onTap: () => controller.updatePatientFormDoctorSide(1),
                                        child: Container(
                                          padding: 10.edgeInsetsAll,
                                          decoration: BoxDecoration(
                                            color: AppColors.darkBlueColor,
                                            borderRadius: 15.borderRadiusAll,
                                          ),
                                          alignment: Alignment.center,
                                          child: GetBuilder<DetailsController>(
                                            builder: (_) {
                                              return controller.isLoading
                                                  ? 25.whiteLoading
                                                  : Text(
                                                      AppStrings.acceptText,
                                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                            color: AppColors.whiteColor,
                                                          ),
                                                    );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    10.gap,
                                    Expanded(
                                      flex: 4,
                                      child: InkWell(
                                        onTap: () => controller.updatePatientFormDoctorSide(-1),
                                        child: Container(
                                          padding: 10.edgeInsetsAll,
                                          decoration: BoxDecoration(
                                            color: AppColors.darkBlueColor,
                                            borderRadius: 15.borderRadiusAll,
                                          ),
                                          alignment: Alignment.center,
                                          child: GetBuilder<DetailsController>(
                                            builder: (_) {
                                              return controller.isLoading
                                                  ? 25.whiteLoading
                                                  : Text(
                                                      AppStrings.cancelText,
                                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                            color: AppColors.whiteColor,
                                                          ),
                                                    );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : controller.currentUser.patients.firstWhere((patient) => patient.email == controller.user.email).isAccepted == 1
                              ? Column(
                                  children: [
                                    Text(
                                      controller.currentUser.patients.firstWhere((patient) => patient.email == controller.user.email).time,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            color: AppColors.darkBlueColor,
                                          ),
                                    ),
                                    Text(
                                      AppStrings.bookedAtText + AppStrings.colonSign + AppStrings.spaceSign + controller.currentUser.patients.firstWhere((patient) => patient.email == controller.user.email).date,
                                    ),
                                    25.gap,
                                    const Text(
                                      AppStrings.youHaveAlreadyAcceptedThisCaseText,
                                    ),
                                    5.gap,
                                    InkWell(
                                      onTap: () => controller.updatePatientFormDoctorSide(-1),
                                      child: Container(
                                        padding: 10.edgeInsetsAll,
                                        decoration: BoxDecoration(
                                          color: AppColors.darkBlueColor,
                                          borderRadius: 15.borderRadiusAll,
                                        ),
                                        alignment: Alignment.center,
                                        child: GetBuilder<DetailsController>(
                                          builder: (_) {
                                            return controller.isLoading
                                                ? 25.whiteLoading
                                                : Text(
                                                    AppStrings.cancelText,
                                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                          color: AppColors.whiteColor,
                                                        ),
                                                  );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Text(
                                      controller.currentUser.patients.firstWhere((patient) => patient.email == controller.user.email).time,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            color: AppColors.darkBlueColor,
                                          ),
                                    ),
                                    Text(
                                      AppStrings.bookedAtText + AppStrings.colonSign + AppStrings.spaceSign + controller.currentUser.patients.firstWhere((patient) => patient.email == controller.user.email).date,
                                    ),
                                    25.gap,
                                    const Text(
                                      AppStrings.youHaveAlreadyCanceledThisCaseText,
                                    ),
                                    5.gap,
                                    InkWell(
                                      onTap: () => controller.updatePatientFormDoctorSide(1),
                                      child: Container(
                                        padding: 10.edgeInsetsAll,
                                        decoration: BoxDecoration(
                                          color: AppColors.darkBlueColor,
                                          borderRadius: 15.borderRadiusAll,
                                        ),
                                        alignment: Alignment.center,
                                        child: GetBuilder<DetailsController>(
                                          builder: (_) {
                                            return controller.isLoading
                                                ? 25.whiteLoading
                                                : Text(
                                                    AppStrings.acceptText,
                                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                          color: AppColors.whiteColor,
                                                        ),
                                                  );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                    },
                  )
                : GetBuilder<DetailsController>(
                    builder: (_) {
                      return controller.user.patients.map((patient) => patient.email).any((email) => email == controller.currentUser.email)
                          ? controller.user.patients.firstWhere((element) => element.email == controller.currentUser.email).isAccepted == 0
                              ? Column(
                                  children: [
                                    const Text(AppStrings.youHaveAlreadySentYourDetailsText),
                                    15.gap,
                                    InkWell(
                                      onTap: controller.deletePatientFromPatientSide,
                                      child: Container(
                                        padding: 10.edgeInsetsAll,
                                        decoration: BoxDecoration(
                                          color: AppColors.darkBlueColor,
                                          borderRadius: 15.borderRadiusAll,
                                        ),
                                        alignment: Alignment.center,
                                        child: GetBuilder<DetailsController>(
                                          builder: (_) {
                                            return controller.isLoading
                                                ? 25.whiteLoading
                                                : Text(
                                                    AppStrings.cancelText,
                                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                          color: AppColors.whiteColor,
                                                        ),
                                                  );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : controller.user.patients.firstWhere((element) => element.email == controller.currentUser.email).isAccepted == 1
                                  ? Column(
                                      children: [
                                        const Text(AppStrings.thisDoctorAcceptedYourCaseText),
                                        Text(AppStrings.yourBookingTimeText + AppStrings.colonSign + AppStrings.spaceSign + controller.user.patients.firstWhere((element) => element.email == controller.currentUser.email).time),
                                      ],
                                    )
                                  : const Column(
                                      children: [
                                        Text(AppStrings.sorryThisDoctorDidNotAcceptedYourCaseText),
                                      ],
                                    )
                          : Column(
                              children: [
                                InkWell(
                                  onTap: controller.pickImage,
                                  child: GetBuilder<DetailsController>(
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
                                15.gap,
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.user.schedules.length,
                                  itemBuilder: (_, int index) {
                                    ScheduleModel schedule = controller.user.schedules[index];
                                    return Container(
                                      padding: 10.edgeInsetsAll,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: 15.borderRadiusAll,
                                        border: Border.all(
                                          color: AppColors.darkBlueColor,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              schedule.day + AppStrings.colonSign + AppStrings.spaceSign + schedule.from + AppStrings.commaSign + AppStrings.spaceSign + schedule.to,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                    color: AppColors.darkBlueColor,
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 0,
                                            child: InkWell(
                                              onTap: () {
                                                controller.time = schedule.day + AppStrings.spaceSign + AppStrings.hyphenSign + AppStrings.spaceSign + schedule.from + AppStrings.commaSign + AppStrings.spaceSign + schedule.to;
                                                controller.update();
                                              },
                                              child: GetBuilder<DetailsController>(
                                                builder: (_) {
                                                  return AnimatedContainer(
                                                    duration: 500.mill,
                                                    padding: 10.edgeInsetsAll,
                                                    decoration: BoxDecoration(
                                                      color: controller.time == schedule.day + AppStrings.spaceSign + AppStrings.hyphenSign + AppStrings.spaceSign + schedule.from + AppStrings.commaSign + AppStrings.spaceSign + schedule.to ? AppColors.darkBlueColor : AppColors.whiteColor,
                                                      borderRadius: 5.borderRadiusAll,
                                                      border: Border.all(
                                                        color: AppColors.darkBlueColor,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, __) {
                                    return 10.gap;
                                  },
                                ),
                                25.gap,
                                InkWell(
                                  onTap: controller.addPatient,
                                  child: Container(
                                    padding: 10.edgeInsetsAll,
                                    decoration: BoxDecoration(
                                      color: AppColors.darkBlueColor,
                                      borderRadius: 15.borderRadiusAll,
                                    ),
                                    alignment: Alignment.center,
                                    child: GetBuilder<DetailsController>(
                                      builder: (_) {
                                        return controller.isLoading
                                            ? 25.whiteLoading
                                            : Text(
                                                AppStrings.sendText,
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      color: AppColors.whiteColor,
                                                    ),
                                              );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () => launch(AppStrings.telText + AppStrings.colonSign + AppStrings.spaceSign + controller.user.phoneNumber),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.darkBlueColor,
            borderRadius: 10.borderRadiusAll,
          ),
          child: const Icon(
            Icons.phone_outlined,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
