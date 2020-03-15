import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRCode extends StatefulWidget {
  @override
  _ScanQRCodeState createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _controller;
  String qrText;

  @override
  Widget build(BuildContext context) {
    double width = getWidth();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Takip Et',
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            width: width,
            height: width,
            top: (MediaQuery.of(context).size.height - width) / 6,
            left: (MediaQuery.of(context).size.width - width) / 2,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  double getWidth() {
    double size =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.width;
    if (size / 2 < 250) {
      if (size > 250) {
        return 250;
      } else {
        return size - 20;
      }
    } else if (size / 2 > 600) {
      return 600;
    } else {
      return size / 2;
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this._controller = controller;
    controller.scannedDataStream.listen((scanData) {
      qrText = scanData;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
