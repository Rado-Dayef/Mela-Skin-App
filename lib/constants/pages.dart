import 'package:get/get.dart';
import 'package:mela_skin/constants/extensions.dart';
import 'package:mela_skin/constants/strings.dart';
import 'package:mela_skin/views/screens/details_screen.dart';
import 'package:mela_skin/views/screens/detect_with_ai_screen.dart';
import 'package:mela_skin/views/screens/home_screen.dart';
import 'package:mela_skin/views/screens/sign_in_screen.dart';
import 'package:mela_skin/views/screens/sign_up_screen.dart';
import 'package:mela_skin/views/screens/splash_screen.dart';

class AppPages {
  static List<GetPage> getPages = [
    GetPage(
      transitionDuration: 1.sec,
      name: AppStrings.homeRoute,
      page: () => const HomeScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      transitionDuration: 1.sec,
      name: AppStrings.signInRoute,
      transition: Transition.downToUp,
      page: () => const SignInScreen(),
    ),
    GetPage(
      transitionDuration: 1.sec,
      name: AppStrings.signUpRoute,
      transition: Transition.downToUp,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      transitionDuration: 1.sec,
      name: AppStrings.splashRoute,
      page: () => const SplashScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      transitionDuration: 1.sec,
      name: AppStrings.detailsRoute,
      page: () => const DetailsScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      transitionDuration: 1.sec,
      name: AppStrings.detectWithAiRoute,
      page: () => const DetectWithAiScreen(),
      transition: Transition.noTransition,
    ),
  ];
}
