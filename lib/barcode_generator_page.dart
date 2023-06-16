import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarcodeGeneratorPage extends StatefulWidget {
  const BarcodeGeneratorPage({Key? key}) : super(key: key);

  @override
  _BarcodeGeneratorPageState createState() => _BarcodeGeneratorPageState();
}

class _BarcodeGeneratorPageState extends State<BarcodeGeneratorPage> {
  final TextEditingController _linkController = TextEditingController();
  String _generatedBarcode = '';

  @override
  void dispose() {
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _linkController,
            decoration: const InputDecoration(
              labelText: 'Enter a link',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _generatedBarcode = _linkController.text;
            });
          },
          child: const Text('Generate Barcode'),
        ),
        const SizedBox(height: 16.0),
        (_generatedBarcode.isNotEmpty)
    ? BarcodeWidget(
        barcode: Barcode.code128(),
        data: _generatedBarcode,
        width: 200,
        height: 80,
        drawText: true,
      )
    : Container(),

      ],
    );
  }
}
