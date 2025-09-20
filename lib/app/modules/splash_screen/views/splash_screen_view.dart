import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/app/constants/colours.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              Spacer(),
              Container(
                height: Get.height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/png/50873b814ac61eb2d66702cb55ba34695adc21cf.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.05,
                width: Get.width * 0.4,
                decoration: BoxDecoration(
                  color: secondaryColour,
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                ),
                child: Center(
                  child: Text(
                    "WELCOME",
                    style: TextStyle(
                      color: splashButtonText,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}
