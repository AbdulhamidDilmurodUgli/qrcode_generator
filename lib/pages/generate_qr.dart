import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  String qrData = "https://github.com/AbdulhamidDilmurodUgli";
  final TextEditingController qrdataFeed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Generate QR Code")),
        backgroundColor: Colors.indigo[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // QR Code display
              QrImageView(
                data: qrData,  // Dynamically use qrData here
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 20),
              const Text(
                "Generate QR Code",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // TextField for user input
              TextField(
                controller: qrdataFeed,
                decoration: const InputDecoration(
                  hintText: "Enter your link here...",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Button to generate QR code
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Update the qrData when user clicks the button
                    if (qrdataFeed.text.isEmpty) {
                      qrData = "https://defaulturl.com"; // Default URL if input is empty
                    } else {
                      qrData = qrdataFeed.text;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.indigo[900],
                ),
                child: const Text(
                  "Generate QR Code",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
