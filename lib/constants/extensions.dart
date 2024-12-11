import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mela_skin/constants/colors.dart';

extension NumbersExtension on num {
  /// Gap.
  SizedBox get gap => SizedBox(width: toDouble(), height: toDouble());

  /// Duration.
  Duration get sec => Duration(seconds: toInt());

  Duration get min => Duration(minutes: toInt());

  Duration get mill => Duration(milliseconds: toInt());

  Duration get micro => Duration(microseconds: toInt());

  /// Edge Insets
  EdgeInsets get edgeInsetsAll => EdgeInsets.all(toDouble());

  EdgeInsets get edgeInsetsTop => EdgeInsets.only(top: toDouble());

  EdgeInsets get edgeInsetsLeft => EdgeInsets.only(left: toDouble());

  EdgeInsets get edgeInsetsRight => EdgeInsets.only(right: toDouble());

  EdgeInsets get edgeInsetsBottom => EdgeInsets.only(bottom: toDouble());

  EdgeInsets get edgeInsetsVertical => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get edgeInsetsHorizontal => EdgeInsets.symmetric(horizontal: toDouble());

  /// Border Radius
  BorderRadius get borderRadiusAll => BorderRadius.circular(toDouble());

  BorderRadius get borderRadiusTop => BorderRadius.vertical(top: Radius.circular(toDouble()));

  BorderRadius get borderRadiusLeft => BorderRadius.horizontal(left: Radius.circular(toDouble()));

  BorderRadius get borderRadiusBottom => BorderRadius.vertical(bottom: Radius.circular(toDouble()));

  BorderRadius get borderRadiusRight => BorderRadius.horizontal(right: Radius.circular(toDouble()));

  BorderRadius get borderRadiusTopLeft => BorderRadius.only(topLeft: Radius.circular(toDouble()));

  BorderRadius get borderRadiusTopRight => BorderRadius.only(topRight: Radius.circular(toDouble()));

  BorderRadius get borderRadiusBottomLeft => BorderRadius.only(bottomLeft: Radius.circular(toDouble()));

  BorderRadius get borderRadiusBottomRight => BorderRadius.only(bottomRight: Radius.circular(toDouble()));

  BorderRadius get borderRadiusAllButTopLeft => BorderRadius.only(topRight: Radius.circular(toDouble()), bottomLeft: Radius.circular(toDouble()), bottomRight: Radius.circular(toDouble()));

  BorderRadius get borderRadiusAllButTopRight => BorderRadius.only(topLeft: Radius.circular(toDouble()), bottomLeft: Radius.circular(toDouble()), bottomRight: Radius.circular(toDouble()));

  BorderRadius get borderRadiusAllButBottomLeft => BorderRadius.only(topLeft: Radius.circular(toDouble()), topRight: Radius.circular(toDouble()), bottomRight: Radius.circular(toDouble()));

  BorderRadius get borderRadiusAllButBottomRight => BorderRadius.only(topLeft: Radius.circular(toDouble()), topRight: Radius.circular(toDouble()), bottomLeft: Radius.circular(toDouble()));

  BorderRadius get defaultBorderRadius => BorderRadius.only(topRight: const Radius.circular(2), bottomRight: Radius.circular(toDouble()), bottomLeft: const Radius.circular(2), topLeft: Radius.circular(toDouble()));

  /// Loading
  Widget get whiteLoading => LoadingAnimationWidget.staggeredDotsWave(color: AppColors.whiteColor, size: toDouble());

  Widget get blueLoading => LoadingAnimationWidget.staggeredDotsWave(color: AppColors.darkBlueColor, size: toDouble());
}

extension StringsExtension on String {
  /// Toast.
  Future<bool?> get showToast => Fluttertoast.showToast(
        msg: this,
        backgroundColor: AppColors.darkBlueColor,
        textColor: AppColors.whiteColor,
        fontSize: 14,
      );
}
