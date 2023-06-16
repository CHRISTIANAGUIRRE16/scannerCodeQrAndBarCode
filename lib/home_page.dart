import 'package:flutter/material.dart';
import 'package:qr_barcode_app/qr_scanner_page.dart';
import 'package:qr_barcode_app/barcode_scanner_page.dart';
import 'package:qr_barcode_app/qr_generator_page.dart';
import 'package:qr_barcode_app/barcode_generator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const QRScannerPage(),
    const BarcodeScannerPage(),
    const QRGeneratorPage(),
    const BarcodeGeneratorPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR & Barcode App'),
        backgroundColor: Colors.black, // Fondo negro para el AppBar
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black, // Fondo negro para el BottomNavigationBar
          primaryColor: Colors.white, // Iconos en color blanco
          textTheme: Theme.of(context).textTheme.copyWith(
                bodySmall: const TextStyle(color: Colors.white), // Texto en color blanco
              ),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'QR Scanner',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'Barcode Scanner',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'QR Generator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'Barcode Generator',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
