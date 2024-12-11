import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/models/firebase_services/firebase_auth_services.dart';

class SignInController extends GetxController {
  bool obscure = true;
  bool isLoading = false;
  String email = AppStrings.emptySign;
  bool forgotPasswordIsLoading = false;
  String password = AppStrings.emptySign;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  /// Toggle obscure
  void toggleObscure() {
    obscure = !obscure;
    update();
  }

  /// Navigate to Sign-Up Screen
  void navigateToSignUp() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.toNamed(AppStrings.signUpRoute);
  }

  /// Sign In Function
  Future<void> signIn() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isLoading = true;
      update();
      User? user = await _authServices.signIn(
        email: email,
        password: password,
      );
      if (user != null) {
        user.emailVerified ? Get.offAllNamed(AppStrings.splashRoute) : AppStrings.pleaseVerifyEmailToast.showToast;
      }
    }
    isLoading = false;
    update();
  }

  /// Reset Password
  Future<void> resetPassword() async {
    FocusManager.instance.primaryFocus?.unfocus();
    forgotPasswordIsLoading = true;
    update();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      int response = await _authServices.resetPassword(email: email);
      if (response == 1) {
        AppStrings.passwordResetEmailSentToast.showToast;
      }
    }
    forgotPasswordIsLoading = false;
    update();
  }
}
