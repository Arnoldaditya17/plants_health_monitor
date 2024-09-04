import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class BleController extends GetxController {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  RxSet<BluetoothDevice> connectedDevices = <BluetoothDevice>{}.obs;

  Stream<List<ScanResult>> get scanResult => flutterBlue.scanResults.map((results) => results.toList());

  @override
  void onInit() {
    super.onInit();
    flutterBlue.connectedDevices.then((devices) {
      connectedDevices.addAll(devices);
    });

    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (!connectedDevices.contains(result.device)) {
          result.device.state.listen((state) {
            if (state == BluetoothDeviceState.connected) {
              connectedDevices.add(result.device);
              update(); // Notify listeners about the state change
            } else if (state == BluetoothDeviceState.disconnected) {
              connectedDevices.remove(result.device);
              update();
            }
          });
        }
      }
    });
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect(
      timeout: const Duration(seconds: 15),
    );
    device.state.listen((state) {
      if (state == BluetoothDeviceState.connected) {
        connectedDevices.add(device);
        update(); // Notify listeners about the state change
      } else if (state == BluetoothDeviceState.disconnected) {
        connectedDevices.remove(device);
        update();
      }
    });
  }

  void scanDevices() {
    flutterBlue.startScan(timeout: const Duration(seconds: 15));
  }
}
