import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mela_skin/constants/bindings.dart';
import 'package:mela_skin/constants/colors.dart';
import 'package:mela_skin/constants/pages.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/constants/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.darkBlueColor,
      ),
    );
    final User? currentUser = FirebaseAuth.instance.currentUser;

    return GetMaterialApp(
      title: AppStrings.appName,
      theme: AppThemes.themeData,
      getPages: AppPages.getPages,
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      initialRoute: currentUser != null && currentUser.emailVerified ? AppStrings.splashRoute : AppStrings.signInRoute,
    );
  }
}
