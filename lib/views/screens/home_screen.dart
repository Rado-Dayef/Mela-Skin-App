import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mela_skin/constants/colors.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/controllers/home_controller.dart';
import 'package:mela_skin/models/user_model.dart';
import 'package:mela_skin/views/widgets/text_form_field_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: controller.signOut,
          child: Container(
            padding: 5.edgeInsetsAll,
            margin: 5.edgeInsetsAll,
            decoration: BoxDecoration(
              borderRadius: 10.borderRadiusAll,
              border: Border.all(
                color: AppColors.whiteColor,
              ),
            ),
            child: Image.asset(
              controller.user.role == AppStrings.doctorText ? AppStrings.doctorLightIcon : AppStrings.patientLightIcon,
            ),
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
          child: SingleChildScrollView(
            padding: 10.edgeInsetsAll,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                TextFormFieldWidget(
                  textController: controller.search,
                  textInputAction: TextInputAction.search,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.darkBlueColor,
                  ),
                  placeholder: AppStrings.searchText,
                  onChanged: (value) {
                    controller.update();
                  },
                ),
                10.gap,
                GetBuilder<HomeController>(
                  builder: (_) {
                    return (controller.user.role == AppStrings.patientText ? controller.readByCondation.isEmpty : controller.readByCondation.where((patient) => controller.user.patients.map((patient) => patient.email).any((email) => email == patient.email)).isEmpty)
                        ? Center(
                            child: Text(
                              controller.user.role == AppStrings.doctorText ? AppStrings.noPatientsFoundText : AppStrings.noDoctorsFoundText,
                            ),
                          )
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.user.role == AppStrings.patientText ? controller.readByCondation.where((user) => user.name.toLowerCase().contains(controller.search.text.toLowerCase())).length : controller.readByCondation.where((patient) => controller.user.patients.map((patient) => patient.email).any((email) => email == patient.email)).where((user) => user.name.toLowerCase().contains(controller.search.text.toLowerCase())).length,
                            itemBuilder: (_, int index) {
                              List<UserModel> readByCondation = controller.user.role == AppStrings.patientText ? controller.readByCondation.where((user) => user.name.toLowerCase().contains(controller.search.text.toLowerCase())).toList() : controller.readByCondation.where((patient) => controller.user.patients.map((patient) => patient.email).any((email) => email == patient.email)).where((user) => user.name.toLowerCase().contains(controller.search.text.toLowerCase())).toList();
                              UserModel user = readByCondation[index];
                              return InkWell(
                                onTap: () => Get.toNamed(AppStrings.detailsRoute, arguments: [user, controller.user]),
                                child: Container(
                                  height: MediaQuery.of(context).size.width * 0.18,
                                  padding: 10.edgeInsetsAll,
                                  decoration: BoxDecoration(
                                    color: AppColors.darkBlueColor,
                                    borderRadius: 15.borderRadiusAll,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: 10.borderRadiusAll,
                                            border: Border.all(
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                          child: Image.asset(user.role == AppStrings.doctorText ? AppStrings.doctorLightIcon : AppStrings.patientLightIcon),
                                        ),
                                      ),
                                      10.gap,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              user.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                    color: AppColors.whiteColor,
                                                  ),
                                            ),
                                            Text(
                                              user.email,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.whiteColor.withOpacity(0.5),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: InkWell(
                                          onTap: () => launch(AppStrings.telText + AppStrings.colonSign + AppStrings.spaceSign + user.phoneNumber),
                                          child: const Icon(
                                            Icons.phone_outlined,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_, __) {
                              return 10.gap;
                            },
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: controller.user.role == AppStrings.patientText
          ? Container(
              padding: 15.edgeInsetsAll,
              decoration: BoxDecoration(
                color: AppColors.darkBlueColor,
                borderRadius: 10.borderRadiusAll,
              ),
              child: InkWell(
                onTap: () => Get.toNamed(AppStrings.detectWithAiRoute),
                child: Text(
                  AppStrings.detectWithAIText,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.whiteColor,
                      ),
                ),
              ),
            )
          : null,
    );
  }
}
