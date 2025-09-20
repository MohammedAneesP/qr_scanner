import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/app/api/scanned_data/scanned_data_api.dart';
import 'package:qr_code_scanner/app/constants/colours.dart';
import 'package:qr_code_scanner/app/models/scanned_results/scanned_result.dart';

class ScannedResultController extends GetxController {
  ScannedResult? result;
  bool isLoading = false;

  @override
  void onInit() async {
    final email = Get.arguments as String?;
    if (email != null) {
      log("recieved in controller $email");
      await getScannedData(email: email);
      // update();
    }

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

  Future<void> getScannedData({required String email}) async {
    final values = ScannedDataApi();
    isLoading = true;
    update();
    try {
      final getData = await values.getScannedTicket(email: email);
      if (getData != null) {
        isLoading = false;
        result = getData;
        update();
        if (getData.success != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(Get.context!).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(25.r)),
                ),
                content: Text(result!.data?.message ?? ""),
                backgroundColor: getData.success! ? kGreen : kRed,
                duration: Duration(seconds: 3),
              ),
            );
          });
        }

        // if (result?.success == false) {
        //   Get.snackbar(
        //     "Error",
        //     result!.data?.message ?? "",
        //     backgroundColor: kRed,
        //     colorText: kWhite,
        //     snackPosition: SnackPosition.BOTTOM,
        //     duration: Duration(seconds: 3),
        //   );
        // } else if (result?.success == true) {

        // }
      }
    } catch (e) {
      log(" ${e.toString()}");
      isLoading = false;
      update();
    }
  }
}
