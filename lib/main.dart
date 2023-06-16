import 'package:flutter/material.dart';
import 'package:qr_barcode_app/home_page.dart';

void main() => runApp(const QRBarcodeApp());

class QRBarcodeApp extends StatelessWidget {
  const QRBarcodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR & Barcode App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
