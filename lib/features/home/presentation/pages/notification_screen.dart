import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // Import this if you haven't already

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    // Typecast the arguments to RemoteMessage
    final message = ModalRoute.of(context)!.settings.arguments;
    print("888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888");
    print(message.toString());
    print("888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888");



    if (message == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        body: const Center(
          child: Text("No notification data available."),
        ),
      );
    }
    // If the message is not null, proceed with type casting
    final RemoteMessage remoteMessage = message as RemoteMessage;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Accessing message details safely
            Text("Title: ${message.notification?.title ?? 'No Title'}"),
            Text("Body: ${message.notification?.body ?? 'No Body'}"),
            Text("Data: ${message.data.toString()}"),
          ],
        ),
      ),
    );
  }
}
