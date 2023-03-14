// ignore: depend_on_referenced_packages
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import '../../bloc/notifications_bloc/notification_cacher_bloc/notification_cacher_bloc.dart';
import '../models/notification_model.dart';
import '../repository/notification_repository.dart';
import 'local_notification.dart';


class NotificationService{

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    NotificationsRepository().addNotification(NotificationModel.fromJson(message.data));
    print("Message keldi bratan");
    print("Handling a background message: ${message.data}");
  }

  handleFirebaseNotificationMessages() async {
    //Foregrounddan kelgan messagelarni tutib olamiz
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        NotificationModel notificationModel = NotificationModel.fromJson(message.data);
        print("FOREGRAUNDGA TUSHDI");
        NotificationCacherBloc().add(DoCachingNotificationEvent(notificationModel: notificationModel));
        //NavigationService.instance.navigateToErrorScreen(routeName: RouteName.bottomNavigation);
        //  LocalNotificationService.localNotificationService.showNotification(id: 1, title: "SALK", subtitle: "ASDASDASDA");
        LocalNotificationService.localNotificationService.showNotification(id: Random().nextInt(100), title: "Sizga pul kelib tushdi", subtitle: "Kirib xabar oling");
      }
    });
  }

  setupInteractedMessage() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();



    if (initialMessage != null) {
      NotificationCacherBloc().add(DoCachingNotificationEvent(notificationModel: NotificationModel.fromJson(initialMessage.data)));

    }
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("On app ishladi");
      NotificationCacherBloc().add(DoCachingNotificationEvent(notificationModel: NotificationModel.fromJson(message.data)));
      //   NavigationService.instance.navigateToErrorScreen(routeName: RouteName.bottomNavigation);
    });
  }
}