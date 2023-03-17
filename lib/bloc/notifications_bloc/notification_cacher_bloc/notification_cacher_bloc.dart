// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import '../../../data/models/notification_model.dart';
import '../../../data/repository/notification_repository.dart';
import '../notification_reader_bloc/notification_reader_bloc.dart';
part 'notification_cacher_event.dart';
part 'notification_cacher_state.dart';

class NotificationCacherBloc extends Bloc<DoCachingNotificationEvent, NotificationCacherState> {
  NotificationCacherBloc() : super(NotificationCacherState(notificationStatus: NotificationStatus.PURE,status: "")) {
    on<DoCachingNotificationEvent>(cacheNotification);
  }

print("asd");
  cacheNotification(DoCachingNotificationEvent event, emit) {
    emit(NotificationCacherState(notificationStatus: NotificationStatus.CACHING_IN_PROGRESS));
    try{
      NotificationsRepository().addNotification(event.notificationModel);
      emit(NotificationCacherState(notificationStatus: NotificationStatus.CACHED_IN_SUCCESS));
      NotificationReaderBloc().add(ReadNotificationEvent());
    }catch(e){
      emit(NotificationCacherState(notificationStatus: NotificationStatus.CACHED_IN_FAILURY,status: e.toString()));
    }

  }
}
