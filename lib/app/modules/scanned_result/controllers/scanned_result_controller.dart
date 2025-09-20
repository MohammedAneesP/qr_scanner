import 'dart:developer';

import 'package:get/get.dart';
import 'package:qr_code_scanner/app/api/scanned_data/scanned_data_api.dart';
import 'package:qr_code_scanner/app/models/scanned_results/scanned_result.dart';

class ScannedResultController extends GetxController {
  ScannedResult? result;

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

    try {
      final getData = await values.getScannedTicket(email: email);
      if (getData != null) {
        result = getData;
        update();
      }
    } catch (e) {
      log(" ${e.toString()}");
    }
  }
}
