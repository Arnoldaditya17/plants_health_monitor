import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BleController extends GetxController {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  Future scanDevices() async {
    if (await Permission.bluetoothScan.request().isGranted) {
      if (await Permission.bluetoothConnect.request().isGranted) {
        flutterBlue.startScan(timeout: const Duration(seconds: 15));
        flutterBlue.stopScan();
      }
    }
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect(
      timeout: const Duration(seconds: 15),
    );
    device.state.listen((isConnected) {
      if (isConnected == BluetoothDeviceState.connecting) {
        print("device connecting!! ${device.name}");
      } else if (isConnected == BluetoothDeviceState.connected) {
        print("device connected!! ${device.name}");
      } else {
        print("device Disconnected!!");
      }
    });
  }

  Stream<List<ScanResult>> get scanResult => flutterBlue.scanResults;
}
