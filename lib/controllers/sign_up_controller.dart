import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/models/firebase_services/cloud_firestore_services.dart';
import 'package:mela_skin/models/firebase_services/firebase_auth_services.dart';
import 'package:mela_skin/models/schedule_model.dart';
import 'package:mela_skin/models/user_model.dart';

class SignUpController extends GetxController {
  bool obscure = true;
  bool isLoading = false;
  List<ScheduleModel> schedules = [];
  String email = AppStrings.emptySign;
  String role = AppStrings.patientText;
  String userName = AppStrings.emptySign;
  String password = AppStrings.emptySign;
  String phoneNumber = AppStrings.emptySign;
  TextEditingController to = TextEditingController();
  TextEditingController day = TextEditingController();
  TextEditingController from = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuthServices _authServices = FirebaseAuthServices();
  final CloudFirestoreServices _cloudServices = CloudFirestoreServices();

  /// Toggle obscure
  void toggleObscure() {
    obscure = !obscure;
    update();
  }

  /// Toggle isPatient
  void toggleIsPatient() {
    role == AppStrings.patientText ? role = AppStrings.doctorText : role = AppStrings.patientText;
    update();
  }

  /// Navigate to Sign-Up Screen
  void navigateToSignIn() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.back();
  }

  /// Sign Up Function
  Future<void> signUp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isLoading = true;
      update();
      User? user = await _authServices.signUp(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
        role: role,
        email: email,
        patients: [],
        name: userName,
        schedules: schedules,
        phoneNumber: phoneNumber,
      );
      if (user != null) {
        _authServices.sendEmailVerification(user).then(
          (response) {
            if (response == 1) {
              Get.back();
              _cloudServices.create(
                AppStrings.usersCollection,
                docId: email,
                data: userModel.asMap(),
              );
            }
          },
        );
      }
    }
    isLoading = false;
    update();
  }
}
