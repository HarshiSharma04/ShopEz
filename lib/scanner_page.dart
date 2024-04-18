import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  List<String> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );

    await _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> _requestCameraPermission() async {
    var status = await Permission.camera.request();
    return status.isGranted;
  }

  Future<void> _scanBarcode() async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      if (barcode.isNotEmpty) {
        setState(() {
          _cartItems.add(barcode);
        });
        print("Scanned barcode: $barcode");
      } else {
        print("Scan canceled");
      }
    } catch (e) {
      print("Error scanning barcode: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<bool>(
              future: _requestCameraPermission(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data == true) {
                  return FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return _controller != null
                            ? CameraPreview(_controller)
                            : Center(child: Text('No camera available'));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                } else {
                  return Center(child: Text('Camera permission not granted'));
                }
              },
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Shopping Cart:',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_cartItems[index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanBarcode,
        child: Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


