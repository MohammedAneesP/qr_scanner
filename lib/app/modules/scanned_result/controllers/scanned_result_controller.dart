import 'dart:developer';

import 'package:get/get.dart';
import 'package:qr_code_scanner/app/api/scanned_data/scanned_data_api.dart';
import 'package:qr_code_scanner/app/models/scanned_results/scanned_result.dart';

class ScannedResultController extends GetxController {
  ScannedResult? result;
  bool isLoading = false;

  @override
  void onInit() async {
    final uniqueIds = Get.arguments as List?;
    if (uniqueIds != null) {
      log("recieved in controller $uniqueIds");
      await getScannedData(uniqueIds: uniqueIds);
      // update();
    }

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getScannedData({required List uniqueIds}) async {
    final values = ScannedDataApi();
    isLoading = true;
    update();
    try {
      final getData = await values.getScannedTicket(uniqueIds: uniqueIds);
      if (getData != null) {
        isLoading = false;
        result = getData;
        log(result?.data?.message.toString() ?? "");
        update();
      }
    } catch (e) {
      log(" ${e.toString()}");
      isLoading = false;
      update();
    }
  }
}
