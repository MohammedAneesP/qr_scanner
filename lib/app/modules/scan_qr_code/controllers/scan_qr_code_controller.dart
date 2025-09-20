import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/app/routes/app_pages.dart';

import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanQrCodeController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? result; // Your barcode result
  String? extractedEmail; // The variable to hold the extracted email
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
        // This triggers the rebuild in GetBuilder
        if (scanData.code != null) {
          result = scanData.code;
          // update();
          extractEmailFromData(scanData.code);
        }
      });
    } catch (e) {
      log(e.toString());
    }
    qrViewController = controller;
    update();
  }

  // void onQRViewCreated(QRViewController controller) {
  //   // so flash button status updates
  // }

  void extractEmailFromData(String? data) {
    final emailRegex = RegExp(
      r'\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\b',
    );
    try {
      if (data != null) {
        final match = emailRegex.firstMatch(data);

        if (match != null) {
          extractedEmail = match.group(0);
        } else {
          extractedEmail = null;
        }

        // Call update() to notify the GetBuilder to rebuild the UI.
        update();
        if (extractedEmail != null) {
          log("from extracted ${extractedEmail.toString()}");
          Get.offNamed(Routes.SCANNED_RESULT, arguments: extractedEmail);
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
