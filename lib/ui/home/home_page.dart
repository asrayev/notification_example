import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../data/service/notification_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String mtoken = "";

  void initState() {
    NotificationService().handleFirebaseNotificationMessages();
    NotificationService().setupInteractedMessage();
    getToken();
    super.initState();
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission (
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,);
        if (settings. authorizationStatus == AuthorizationStatus.authorized){
    print ('User granted permission');
  } else if (settings. authorizationStatus == AuthorizationStatus.provisional) {
          print('User granted provisional permission');
        }
          else {
print ('User declined or has not accepted permission');}}

  void getToken() async {
    FirebaseMessaging.instance.getToken().then((value) async {
     // var shared = await SharedPreferences.getInstance();
     //
      print("Token: $value");
    });
  }




  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("asdaasdasdasdasd"),
      ),
    );
  }
}
