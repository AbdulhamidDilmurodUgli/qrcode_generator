import 'package:flutter/material.dart';
import 'package:qrcode_generator/pages/generate_qr.dart'; // Import your actual 'generate_qr' page
import 'package:qrcode_generator/pages/scan_qr_page.dart'; // Import your actual 'scan_qr_page' page

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Code Generator")),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16.0), 
          // width: 450,
          // height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Display Image
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQyYwscUPOH_qPPe8Hp0HAbFNMx-TxRFubpg&usqp=CAU",
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // image is loaded
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text('Failed to load image'));
                },
              ),
              SizedBox(height: 20),
          
              // First Button for Scan QR
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  side: BorderSide(color: Colors.indigo[900]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => ScanQR()));
                },
                child: Text(
                  "Scan QR Code",
                  style: TextStyle(color: Colors.indigo[900]),
                ),
              ),
              SizedBox(height: 10),
          
              // Second Button for Generate QR
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  side: BorderSide(color: Colors.indigo[900]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  print("Navigating to Generate QR Page");
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => GenerateQR()));
                },
                child: Text(
                  "Generate QR Code",
                  style: TextStyle(color: Colors.indigo[900]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
