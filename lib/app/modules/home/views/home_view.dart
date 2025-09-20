import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/app/constants/colours.dart';
import 'package:qr_code_scanner/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.05),
          Center(
            child: Container(
              height: Get.height * 0.26,
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                // color: kRed,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/png/50873b814ac61eb2d66702cb55ba34695adc21cf.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            "Welcome to Charisma",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: kWhite,
            ),
          ),
          Text(
            "attendee scanner",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: kWhite,
            ),
          ),
          SizedBox(height: Get.height * 0.12),
          IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(secondaryColour),
              minimumSize: WidgetStatePropertyAll(
                Size(Get.width * 0.7, Get.height * 0.24),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                ),
              ),
            ),
            onPressed: () {
              Get.toNamed(Routes.SCAN_QR_CODE);
            },
            icon: Column(
              children: [
                Text(
                  "TAP TO SCAN",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: kBlack,
                  ),
                ),
                SizedBox(height: Get.height * 0.015),
                SvgPicture.asset("assets/images/svg/qr_icon.svg"),
              ],
            ),
          ),
          SizedBox(height: Get.height * 0.08),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(kRed),
              minimumSize: WidgetStatePropertyAll(
                Size(Get.width * 0.4, Get.height * 0.05),
              ),
            ),
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text(
              "EXIT",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: kWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
