import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/app/routes/app_pages.dart';

import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanQrCodeController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? result; // Your barcode result
  List<String> cmaList = []; // Store extracted CMA codes
  QRViewController? controller;
  QRViewController? qrViewController;

  // Handles hot reload for Android and iOS

  void reassemble() {
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
    update();
  }

  // Method to be passed to onQRViewCreated
  void onQRViewCreated(QRViewController controller) {
    try {
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) {
        result = scanData.code; // Full scanned text
        // log(scanData.code.toString());
        if (scanData.code != null) {
          // Split into lines
          final lines = scanData.code!.split('\n');
          // Find the first line that starts with CMA
          final cmaLine = lines.firstWhere(
            (line) => line.trim().startsWith('CMA'),
            orElse: () => '',
          );
          if (cmaLine.isNotEmpty) {
            cmaList.add(cmaLine.trim()); // Store it in the list
          }
          if (cmaList.isNotEmpty) {
            log("scanned uniq id list  ${cmaList.toString()}");
            Get.offNamed(Routes.SCANNED_RESULT, arguments: cmaList);
          }
        }
        update(); // refresh GetX state
      });
    } catch (e) {
      log(e.toString());
    }
    qrViewController = controller;
    update();
  }

  // void extractEmailFromData(String? data) {
  //   final emailRegex = RegExp(
  //     r'\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\b',
  //   );
  //   try {
  //     if (data != null) {
  //       final match = emailRegex.firstMatch(data);

  //       if (match != null) {
  //         extractedEmail = match.group(0);
  //       } else {
  //         extractedEmail = null;
  //       }

  //       // Call update() to notify the GetBuilder to rebuild the UI.
  //       update();
  //       if (extractedEmail != null) {
  //         log("from extracted ${extractedEmail.toString()}");
  //         Get.offNamed(Routes.SCANNED_RESULT, arguments: extractedEmail);
  //       }
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
