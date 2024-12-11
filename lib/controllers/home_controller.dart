import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/models/firebase_services/firebase_auth_services.dart';
import 'package:mela_skin/models/user_model.dart';

class HomeController extends GetxController {
  UserModel user = Get.arguments[0];
  List<UserModel> readByCondation = Get.arguments[1];
  TextEditingController search = TextEditingController();
  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  void signOut() async {
    await _authServices.signOut();
    Get.offAllNamed(AppStrings.signInRoute);
  }
}
