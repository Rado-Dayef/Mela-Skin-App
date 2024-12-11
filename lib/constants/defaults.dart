import 'package:flutter/material.dart';
import 'package:mela_skin/constants/colors.dart';

class AppDefaults {
  static UnderlineInputBorder defaultInputBorder({
    Color? borderColor,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? AppColors.darkBlueColor),
    );
  }
}
