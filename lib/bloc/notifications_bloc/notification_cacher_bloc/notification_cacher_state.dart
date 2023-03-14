part of 'notification_cacher_bloc.dart';

class NotificationCacherState extends Equatable {
  String? status;
  NotificationStatus? notificationStatus;

  NotificationCacherState({this.status,this.notificationStatus});

  copyWith({
    String? status,
    NotificationStatus? notificationStatus,
  }){
    return NotificationCacherState(
        status: status??this.status,
        notificationStatus: notificationStatus??this.notificationStatus
    );
  }





  @override
  List<Object?> get props => [
    status,
    notificationStatus
  ];
}

enum NotificationStatus{
  GOT_NOTIFICATION,
  CACHING_IN_PROGRESS,
  CACHED_IN_FAILURY,
  CACHED_IN_SUCCESS,
  PURE
}