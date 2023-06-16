import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class QRGeneratorPage extends StatefulWidget {
  const QRGeneratorPage({Key? key}) : super(key: key);

  @override
  _QRGeneratorPageState createState() => _QRGeneratorPageState();
}

class _QRGeneratorPageState extends State<QRGeneratorPage> {
  final TextEditingController _linkController = TextEditingController();
  String _generatedQR = '';

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
              _generatedQR = _linkController.text;
            });
          },
          child: const Text('Generate QR'),
        ),
        const SizedBox(height: 16.0),
        (_generatedQR.isNotEmpty)
            ? GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse(_generatedQR));
                },
                child: QrImage(
                  data: _generatedQR,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              )
            : Container(),
      ],
    );
  }
}
