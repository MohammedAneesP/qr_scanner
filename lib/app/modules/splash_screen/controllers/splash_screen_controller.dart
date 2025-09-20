import 'package:get/get.dart';
import 'package:qr_code_scanner/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    await goto();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> goto() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.offNamed(Routes.HOME);
  }
}
