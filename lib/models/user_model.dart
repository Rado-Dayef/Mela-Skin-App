import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/models/patient_model.dart';
import 'package:mela_skin/models/schedule_model.dart';

class UserModel {
  String role;
  String name;
  String email;
  String phoneNumber;
  List<PatientModel> patients;
  List<ScheduleModel> schedules;

  UserModel({
    required this.role,
    required this.name,
    required this.email,
    required this.patients,
    required this.schedules,
    required this.phoneNumber,
  });

  String get asString => "User(role: $role, name: $name, email: $email, phoneNumber: $phoneNumber, schedules: ${schedules.map((schedule) => schedule.asString)}, patients: ${patients.map((patient) => patient.asString)})";

  Map<String, dynamic> asMap() {
    return {
      AppStrings.roleField: role,
      AppStrings.nameField: name,
      AppStrings.emailField: email,
      AppStrings.phoneNumberField: phoneNumber,
      AppStrings.patientsField: patients.map((patient) => patient.asMap()),
      AppStrings.schedulesField: schedules.map((patient) => patient.asMap()),
    };
  }

  factory UserModel.asModel(Map<String, dynamic> map) {
    return UserModel(
      role: map[AppStrings.roleField],
      name: map[AppStrings.nameField],
      email: map[AppStrings.emailField],
      phoneNumber: map[AppStrings.phoneNumberField],
      patients: List<Map<String, dynamic>>.from(map[AppStrings.patientsField]).map((patient) => PatientModel.asModel(patient)).toList(),
      schedules: List<Map<String, dynamic>>.from(map[AppStrings.schedulesField]).map((schedule) => ScheduleModel.asModel(schedule)).toList(),
    );
  }
}
