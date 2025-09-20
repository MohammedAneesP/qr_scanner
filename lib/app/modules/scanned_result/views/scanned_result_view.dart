import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/app/constants/colours.dart';
import 'package:qr_code_scanner/app/routes/app_pages.dart';

import '../controllers/scanned_result_controller.dart';

class ScannedResultView extends GetView<ScannedResultController> {
  const ScannedResultView({super.key});
  @override
  Widget build(BuildContext context) {
    final scannedData = Get.arguments as String?;
    Get.put(ScannedResultController());
    log(" recieved from argument $scannedData");
    return GetBuilder<ScannedResultController>(
      builder: (controller) {
        if (controller.isLoading == true) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: secondaryColour),
            ),
          );
        } else if (controller.result == null) {
          return Scaffold(body: Center(child: Text("no data")));
        } else {
          
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
              child: Column(
                children: [
                  Spacer(),
                  Center(
                    child: Text(
                      "SUCCESS",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: kWhite,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Container(
                    height: Get.height * 0.23,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: secondaryColour,
                      borderRadius: BorderRadius.all(Radius.circular(25.r)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * .22,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      Get.width * 0.017,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      "Ticket IDs",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kBlack,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  ": ",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kBlack,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    controller.result?.data?.tickets?.id ?? "",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: kBlack,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * .22,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      Get.width * 0.095,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kBlack,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  ": ",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kBlack,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    controller.result?.data?.name ?? "",

                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: kBlack,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              "Number Of",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: kBlack,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * .22,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      Get.width * 0.02,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      "attendees",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kBlack,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  ": ",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kBlack,
                                  ),
                                ),
                                Text(
                                  controller.result?.data?.numberOfAttendees
                                          .toString() ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kBlack,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * .22,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      Get.width * 0.1,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      "Email ",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kBlack,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  ": ",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kBlack,
                                  ),
                                ),
                                Text(
                                  scannedData ?? '',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kBlack,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: Get.height * 0.03),

                  /// icon button row -------------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            secondaryColour,
                          ),
                          minimumSize: WidgetStatePropertyAll(
                            Size(Get.width * 0.3, Get.height * 0.15),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.r),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.HOME);
                        },
                        icon: Column(
                          children: [
                            // SizedBox(height: Get.height * 0.015),
                            Icon(Icons.home_filled, color: kBlack, size: 40),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              "HOME",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w900,
                                color: kBlack,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.015),
                          ],
                        ),
                      ),
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            secondaryColour,
                          ),
                          minimumSize: WidgetStatePropertyAll(
                            Size(Get.width * 0.3, Get.height * 0.15),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.r),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.offNamed(Routes.SCAN_QR_CODE);
                        },
                        icon: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/svg/qr_icon.svg",
                              height: Get.height * 0.04,
                            ),
                            SizedBox(height: Get.height * 0.015),
                            Text(
                              "SCAN AGAIN",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w900,
                                color: kBlack,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.015),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // EXIT BUTTON ------------------------------
                  SizedBox(height: Get.height * 0.03),
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
                  Spacer(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
