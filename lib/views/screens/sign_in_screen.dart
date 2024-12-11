import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mela_skin/constants/colors.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/controllers/sign_in_controller.dart';
import 'package:mela_skin/views/widgets/hero_widget.dart';
import 'package:mela_skin/views/widgets/text_form_field_widget.dart';

class SignInScreen extends GetWidget<SignInController> {
  const SignInScreen({super.key});

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
                        AppStrings.signInText,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
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
                    child: GetBuilder<SignInController>(
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
                  25.gap,
                  HeroWidget(
                    tag: AppStrings.buttonTag,
                    child: InkWell(
                      onTap: controller.isLoading ? null : controller.signIn,
                      child: Container(
                        height: 50,
                        padding: 10.edgeInsetsAll,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.darkBlueColor,
                          borderRadius: 15.borderRadiusAll,
                        ),
                        child: GetBuilder<SignInController>(
                          builder: (_) {
                            return controller.isLoading
                                ? 25.whiteLoading
                                : Text(
                                    AppStrings.signInText,
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
                  GetBuilder<SignInController>(
                    builder: (_) {
                      return controller.forgotPasswordIsLoading
                          ? 25.blueLoading
                          : InkWell(
                              onTap: controller.resetPassword,
                              child: Text(
                                AppStrings.forgotPasswordText + AppStrings.questionSign,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            );
                    },
                  ),
                  15.gap,
                  HeroWidget(
                    tag: AppStrings.doNotHaveTag,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.doNotHaveAnAccountText + AppStrings.questionSign,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        InkWell(
                          onTap: controller.navigateToSignUp,
                          child: Text(
                            AppStrings.spaceSign + AppStrings.signUpText,
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
