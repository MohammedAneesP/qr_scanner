import 'package:get/get.dart';

import '../controllers/scanned_result_controller.dart';

class ScannedResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannedResultController>(
      () => ScannedResultController(),
    );
  }
}
