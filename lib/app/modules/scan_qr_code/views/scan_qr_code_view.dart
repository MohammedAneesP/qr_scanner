import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/app/constants/colours.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../controllers/scan_qr_code_controller.dart';

class ScanQrCodeView extends GetView<ScanQrCodeController> {
  const ScanQrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    // You can instantiate the controller here if it's not already done
    // Get.put(ScanQrCodeController());
    return GetBuilder<ScanQrCodeController>(
      builder: (context) {
        return Scaffold(
          body: Column(
            children: [
              Spacer(),
              SizedBox(
                height: Get.height * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  child: QRView(
                    key: controller.qrKey,
                    onQRViewCreated: controller.onQRViewCreated,
                    overlay: QrScannerOverlayShape(borderRadius: 15.r),
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.1,
                width: Get.width,
                decoration: BoxDecoration(
                  color: secondaryColour,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r),
                  ),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Show E- Ticket",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: kBlack,
                      ),
                    ),
                    Text(
                      "SCAN the QR CODE",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: kBlack,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              IconButton(
                icon: FutureBuilder(
                  future: controller.qrViewController?.getFlashStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return Icon(
                        Icons.flashlight_on,
                        color: kWhite,
                        size: 40.sp,
                      );
                    } else {
                      return Icon(
                        Icons.flashlight_off,
                        color: kWhite,
                        size: 40.sp,
                      );
                    }
                  },
                ),
                onPressed: () async {
                  await controller.qrViewController?.toggleFlash();
                  controller.update(); // refresh UI (since you use GetBuilder)
                },
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}
