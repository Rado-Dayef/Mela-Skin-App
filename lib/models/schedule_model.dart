import 'package:mela_skin/constants/strings.dart';

class ScheduleModel {
  String to;
  String day;
  String from;

  ScheduleModel({
    required this.to,
    required this.day,
    required this.from,
  });

  String get asString => "Schedule(to: $to, day: $day, from: $from)";

  Map<String, dynamic> asMap() {
    return {
      AppStrings.toField: to,
      AppStrings.dayField: day,
      AppStrings.fromField: from,
    };
  }

  factory ScheduleModel.asModel(Map<String, dynamic> map) {
    return ScheduleModel(
      to: map[AppStrings.toField],
      day: map[AppStrings.dayField],
      from: map[AppStrings.fromField],
    );
  }
}
