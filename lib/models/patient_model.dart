import 'package:mela_skin/constants/strings.dart';

class PatientModel {
  String time;
  String date;
  String email;
  int isAccepted;

  PatientModel({
    required this.time,
    required this.date,
    required this.email,
    required this.isAccepted,
  });

  String get asString => "Patient(time: $time, date: $date, email: $email, isAccepted: $isAccepted)";

  Map<String, dynamic> asMap() {
    return {
      AppStrings.timeField: time,
      AppStrings.dateField: date,
      AppStrings.emailField: email,
      AppStrings.isAcceptedField: isAccepted,
    };
  }

  factory PatientModel.asModel(Map<String, dynamic> map) {
    return PatientModel(
      time: map[AppStrings.timeField],
      date: map[AppStrings.dateField],
      email: map[AppStrings.emailField],
      isAccepted: map[AppStrings.isAcceptedField],
    );
  }
}
