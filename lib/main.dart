import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_messaging/firebase_messaging.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:notification_example/ui/home/home_page.dart';
import 'data/service/notification_service.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(NotificationService().firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.subscribeToTopic("ishonch_news");

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage()

    );
  }
}
