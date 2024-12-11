import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/models/firebase_services/cloud_firestore_services.dart';
import 'package:mela_skin/models/user_model.dart';

class SplashController extends GetxController {
  final CloudFirestoreServices _cloudServices = CloudFirestoreServices();

  @override
  void onInit() {
    _cloudServices.readSpecificDocument(AppStrings.usersCollection, FirebaseAuth.instance.currentUser!.email!).then(
      (readSpecificDocumentResponse) {
        if (readSpecificDocumentResponse is Map<String, dynamic>) {
          UserModel user = UserModel.asModel(readSpecificDocumentResponse);
          _cloudServices.readByCondation(AppStrings.usersCollection, fieldName: AppStrings.roleField, fieldValue: user.role == AppStrings.patientText ? AppStrings.doctorText : AppStrings.patientText).then(
            (readByCondationResponse) {
              if (readByCondationResponse is List<Map<String, dynamic>>) {
                List<UserModel> readByCondation = readByCondationResponse.map((element) => UserModel.asModel(element)).toList();
                Future.delayed(
                  5.sec,
                  () {
                    Get.offNamed(
                      AppStrings.homeRoute,
                      arguments: [user, readByCondation],
                    );
                  },
                );
              }
            },
          );
        } else {
          AppStrings.noUserFoundToast.showToast;
        }
      },
    );
    super.onInit();
  }
}
