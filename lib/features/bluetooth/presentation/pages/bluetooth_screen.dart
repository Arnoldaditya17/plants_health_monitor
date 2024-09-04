import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:plant_health_monitor/features/bluetooth/presentation/pages/ble_controller.dart';

class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({super.key});

  @override
  State<BluetoothScreen> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bluetooth Devices',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        body: GetBuilder<BleController>(
          init: BleController(),
          builder: (BleController controller) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: StreamBuilder<List<ScanResult>>(
                      stream: controller.scanResult,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text('Error occurred'),
                          );
                        }
                        if (snapshot.hasData) {
                          final results = snapshot.data!;
                          return ListView.builder(
                            itemCount: results.length,
                            itemBuilder: (context, index) {
                              final data = results[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 2),
                                child: Card(
                                  child: ListTile(
                                    leading: const Icon(Icons.bluetooth),
                                    title: Text(data.device.name.isNotEmpty
                                        ? data.device.name
                                        : 'Unknown Device'),
                                    subtitle: Text(data.device.id.id),
                                    trailing: Text(
                                      data.rssi.toString(),
                                    ),
                                    onTap: () {
                                      controller.connectToDevice(data.device);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text('No device found'),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.scanDevices();
                    },
                    child: const Text(
                      "Scan",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
