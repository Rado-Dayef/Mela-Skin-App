import 'package:get/get.dart';
import 'package:mela_skin/controllers/details_controller.dart';
import 'package:mela_skin/controllers/detect_with_ai_controller.dart';
import 'package:mela_skin/controllers/home_controller.dart';
import 'package:mela_skin/controllers/sign_in_controller.dart';
import 'package:mela_skin/controllers/sign_up_controller.dart';
import 'package:mela_skin/controllers/splash_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SignInController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SignUpController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SplashController(),
      fenix: true,
    );
    Get.lazyPut(
      () => DetailsController(),
      fenix: true,
    );
    Get.lazyPut(
      () => DetectWithAiController(),
      fenix: true,
    );
  }
}
