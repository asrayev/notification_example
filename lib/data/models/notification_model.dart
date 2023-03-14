class NotificationModel {

  final String id;


  NotificationModel({required this.id,});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json["id"] ?? "",);
  }

  toJson() {
    return {"id": id.toString(),};
  }
}
