import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/controllers/home_controller.dart';
import 'package:mela_skin/models/firebase_services/cloud_firestore_services.dart';
import 'package:mela_skin/models/patient_model.dart';
import 'package:mela_skin/models/user_model.dart';

class DetailsController extends GetxController {
  File? image;
  bool isLoading = false;
  DateTime now = DateTime.now();
  UserModel user = Get.arguments[0];
  String time = AppStrings.emptySign;
  UserModel currentUser = Get.arguments[1];
  final CloudFirestoreServices _cloudServices = CloudFirestoreServices();

  pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }

  void addPatient() {
    isLoading = true;
    update();
    Future.delayed(
      5.sec,
      () {
        String nowFormat = DateFormat(AppStrings.dateFormat).format(now);
        List<PatientModel> patients = user.patients;
        PatientModel patient = PatientModel(
          time: time,
          isAccepted: 0,
          date: nowFormat.substring(0, nowFormat.length - 2) + nowFormat.substring(nowFormat.length - 2).toLowerCase(),
          email: currentUser.email,
        );
        if (time.isNotEmpty && image != null) {
          patients.add(patient);
          _cloudServices.update(AppStrings.usersCollection, docId: user.email, data: {AppStrings.patientsField: patients.map((patient) => patient.asMap())}).then((_) => user.patients.add(patient));
          image = null;
          time = AppStrings.emptySign;
          isLoading = false;
          update();
        } else {
          AppStrings.pleaseMakeSureThatYouHaveUploadedAnImageAndSelectedATimeForThatBookingToast.showToast;
          isLoading = false;
          update();
        }
      },
    );
  }

  void deletePatientFromPatientSide() {
    isLoading = true;
    update();
    Future.delayed(
      5.sec,
      () {
        List<PatientModel> patients = user.patients;
        patients.removeWhere((patient) => patient.email == currentUser.email);
        _cloudServices.update(AppStrings.usersCollection, docId: user.email, data: {AppStrings.patientsField: patients.map((patient) => patient.asMap())}).then((_) => user.patients.removeWhere((patient) => patient.email == currentUser.email));
        isLoading = false;
        update();
      },
    );
  }

  void updatePatientFormDoctorSide(int isAccepted) {
    isLoading = true;
    update();
    Future.delayed(
      5.sec,
      () {
        HomeController homeController = Get.find<HomeController>();
        List<PatientModel> patients = homeController.user.patients;
        patients.firstWhere((patient) => patient.email == user.email).isAccepted = isAccepted;
        _cloudServices.update(AppStrings.usersCollection, docId: currentUser.email, data: {AppStrings.patientsField: patients.map((patient) => patient.asMap())}).then((_) => patients.firstWhere((patient) => patient.email == user.email).isAccepted = isAccepted);
        isLoading = false;
        homeController.update();
        update();
      },
    );
  }
}
