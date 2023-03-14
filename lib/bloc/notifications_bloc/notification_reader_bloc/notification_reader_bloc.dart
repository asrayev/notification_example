import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../data/models/notification_model.dart';
import '../../../data/repository/notification_repository.dart';
part 'notification_reader_event.dart';
part 'notification_reader_state.dart';

class NotificationReaderBloc extends Bloc<ReadNotificationEvent, NotificationReaderState> {
  NotificationReaderBloc() : super(NotificationReaderInitial()) {
    on<ReadNotificationEvent>(readNotifications);
    on<DeleteNotificationsEvent>(deleteNotifications);
  }

  readNotifications(event, emit) async {
    emit(ReadNotificationInProgress());
    try{
      var  notificationsList = await NotificationsRepository().getNotifications();
      List<NotificationModel> notifications = notificationsList.map((e) => NotificationModel.fromJson(e)).toList();
      emit(ReadNotificationInSuccess(notifications: notifications));
    }catch(e){
      emit(ReadNotificationInFailury(status: e.toString()));
    }
  }


  deleteNotifications(event, emit) async {
    print("DELETED");
    NotificationsRepository().deleteNotifications();
    add(ReadNotificationEvent());
  }
}