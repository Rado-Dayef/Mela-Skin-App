import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mela_skin/constants/colors.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/controllers/sign_up_controller.dart';
import 'package:mela_skin/models/schedule_model.dart';
import 'package:mela_skin/views/widgets/hero_widget.dart';
import 'package:mela_skin/views/widgets/text_form_field_widget.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

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
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  HeroWidget(
                    tag: AppStrings.titleTag,
                    child: Text(
                      AppStrings.appName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  15.gap,
                  HeroWidget(
                    tag: AppStrings.screenTitleTag,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.signUpText,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  15.gap,
                  TextFormFieldWidget(
                    labelName: AppStrings.userNameText,
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: AppColors.darkBlueColor,
                    ),
                    onSaved: (value) {
                      controller.userName = value!.trim();
                      controller.update();
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.userNameText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                      } else if (value.length < 4) {
                        return AppStrings.userNameText + AppStrings.spaceSign + AppStrings.lessThen4Validation;
                      } else if (value.length > 24) {
                        return AppStrings.userNameText + AppStrings.spaceSign + AppStrings.largerThen24Validation;
                      }
                      return null;
                    },
                  ),
                  15.gap,
                  HeroWidget(
                    tag: AppStrings.emailTag,
                    child: TextFormFieldWidget(
                      labelName: AppStrings.emailText,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppColors.darkBlueColor,
                      ),
                      onSaved: (value) {
                        controller.email = value!.trim();
                        controller.update();
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.emailText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                        } else if (!RegExp(r"^[^@.]$").hasMatch(value[0]) || !RegExp(r"^[^@.]$").hasMatch(value[value.length - 1]) || RegExp(r'[^\w@.]').hasMatch(value)) {
                          return AppStrings.invalidEmailValidation;
                        } else if (!value.contains(AppStrings.atSign)) {
                          return AppStrings.emailDoesNotContainAtValidation;
                        }
                        return null;
                      },
                    ),
                  ),
                  15.gap,
                  HeroWidget(
                    tag: AppStrings.passwordTag,
                    child: GetBuilder<SignUpController>(
                      builder: (_) {
                        return TextFormFieldWidget(
                          labelName: AppStrings.passwordText,
                          obscure: controller.obscure,
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: AppColors.darkBlueColor,
                          ),
                          suffixIcon: InkWell(
                            onTap: controller.toggleObscure,
                            child: Icon(
                              controller.obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: AppColors.darkBlueColor,
                            ),
                          ),
                          onSaved: (value) {
                            controller.password = value!.trim();
                            controller.update();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.passwordText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                            } else if (value.length < 8) {
                              return AppStrings.passwordText + AppStrings.spaceSign + AppStrings.lessThen8Validation;
                            } else if (value.length > 24) {
                              return AppStrings.passwordText + AppStrings.spaceSign + AppStrings.largerThen24Validation;
                            }
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                  15.gap,
                  TextFormFieldWidget(
                    labelName: AppStrings.phoneNumberText,
                    prefixIcon: const Icon(
                      Icons.phone_outlined,
                      color: AppColors.darkBlueColor,
                    ),
                    placeholder: AppStrings.dumPhoneNumberText,
                    onSaved: (value) {
                      controller.phoneNumber = value!.trim();
                      controller.update();
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.phoneNumberText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                      } else if (value.length != 11) {
                        return AppStrings.invalidPhoneNumberValidation;
                      }
                      return null;
                    },
                  ),
                  15.gap,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.roleText + AppStrings.colonSign,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  5.gap,
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 0,
                              child: GetBuilder<SignUpController>(
                                builder: (_) {
                                  return InkWell(
                                    onTap: controller.toggleIsPatient,
                                    child: AnimatedContainer(
                                      duration: 500.mill,
                                      padding: 10.edgeInsetsAll,
                                      decoration: BoxDecoration(
                                        color: controller.role == AppStrings.patientText ? AppColors.darkBlueColor : AppColors.whiteColor,
                                        borderRadius: 5.borderRadiusAll,
                                        border: Border.all(
                                          color: AppColors.darkBlueColor,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            10.gap,
                            Text(
                              AppStrings.patientText,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 0,
                              child: InkWell(
                                onTap: controller.toggleIsPatient,
                                child: GetBuilder<SignUpController>(
                                  builder: (_) {
                                    return AnimatedContainer(
                                      duration: 500.mill,
                                      padding: 10.edgeInsetsAll,
                                      decoration: BoxDecoration(
                                        color: controller.role == AppStrings.doctorText ? AppColors.darkBlueColor : AppColors.whiteColor,
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
                            10.gap,
                            Text(
                              AppStrings.doctorText,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GetBuilder<SignUpController>(
                    builder: (_) {
                      return controller.role == AppStrings.patientText
                          ? 0.gap
                          : Column(
                              children: [
                                15.gap,
                                Container(
                                  width: double.infinity,
                                  padding: 10.edgeInsetsAll,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: 15.borderRadiusAll,
                                    border: Border.all(
                                      color: AppColors.darkBlueColor,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        AppStrings.scheduleText,
                                        style: Theme.of(context).textTheme.titleSmall,
                                      ),
                                      10.gap,
                                      GetBuilder<SignUpController>(
                                        builder: (_) {
                                          return controller.schedules.isEmpty
                                              ? const Text(AppStrings.noSchedulesYetText)
                                              : ListView.separated(
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  itemBuilder: (_, int index) {
                                                    ScheduleModel schedule = controller.schedules[index];
                                                    String to = schedule.to;
                                                    String day = schedule.day;
                                                    String from = schedule.from;
                                                    return Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            day + AppStrings.colonSign + AppStrings.spaceSign + from + AppStrings.spaceSign + to,
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: Theme.of(context).textTheme.bodyMedium,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller.schedules.removeWhere((schedule) => schedule.day == day && schedule.from == from && schedule.to == to);
                                                            controller.update();
                                                          },
                                                          child: const Icon(
                                                            Icons.remove,
                                                            color: AppColors.darkBlueColor,
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                  separatorBuilder: (_, __) {
                                                    return 5.gap;
                                                  },
                                                  itemCount: controller.schedules.length,
                                                );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                15.gap,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppStrings.addScheduleText + AppStrings.colonSign,
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                5.gap,
                                TextFormFieldWidget(
                                  textController: controller.day,
                                  labelName: AppStrings.dayText,
                                ),
                                10.gap,
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormFieldWidget(
                                        textController: controller.from,
                                        labelName: AppStrings.fromText,
                                      ),
                                    ),
                                    10.gap,
                                    Expanded(
                                      child: TextFormFieldWidget(
                                        textController: controller.to,
                                        labelName: AppStrings.toText,
                                      ),
                                    ),
                                  ],
                                ),
                                10.gap,
                                InkWell(
                                  onTap: () {
                                    ScheduleModel schedule = ScheduleModel(
                                      day: controller.day.text.trim(),
                                      from: controller.from.text.trim(),
                                      to: controller.to.text.trim(),
                                    );
                                    controller.schedules.add(schedule);
                                    controller.day.clear();
                                    controller.from.clear();
                                    controller.to.clear();
                                    controller.update();
                                  },
                                  child: Container(
                                    padding: 10.edgeInsetsAll,
                                    decoration: BoxDecoration(
                                      color: AppColors.darkBlueColor,
                                      borderRadius: 15.borderRadiusAll,
                                    ),
                                    child: Text(
                                      "Add",
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: AppColors.whiteColor,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                  25.gap,
                  HeroWidget(
                    tag: AppStrings.buttonTag,
                    child: InkWell(
                      onTap: controller.isLoading ? null : controller.signUp,
                      child: Container(
                        height: 50,
                        padding: 10.edgeInsetsAll,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.darkBlueColor,
                          borderRadius: 15.borderRadiusAll,
                        ),
                        child: GetBuilder<SignUpController>(
                          builder: (_) {
                            return controller.isLoading
                                ? 25.whiteLoading
                                : Text(
                                    AppStrings.signUpText,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: AppColors.whiteColor,
                                        ),
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                  15.gap,
                  HeroWidget(
                    tag: AppStrings.doNotHaveTag,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.alreadyHaveAnAccountText + AppStrings.questionSign,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        InkWell(
                          onTap: controller.navigateToSignIn,
                          child: Text(
                            AppStrings.spaceSign + AppStrings.signInText,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
