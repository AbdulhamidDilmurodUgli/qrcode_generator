import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrCodeResult = "Not Yet Scanned";

  // Method to scan the QR code
  Future<void> scanQRCode() async {
    try {
      String scannedCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Line color
        'Cancel',  // Cancel button text
        true,      // Show flash button
        ScanMode.QR,
      );

      // If the user doesn't cancel, update the result
      if (scannedCode != '-1') {
        setState(() {
          qrCodeResult = scannedCode;
        });
      }
    } catch (e) {
      setState(() {
        qrCodeResult = "Failed to scan QR Code: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display QR code result
            const Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrCodeResult,
              style: const TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),

            // Button to scan QR code
            ElevatedButton(
              onPressed: scanQRCode,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text("Open Scanner"),
            ),
          ],
        ),
      ),
    );
  }
}
