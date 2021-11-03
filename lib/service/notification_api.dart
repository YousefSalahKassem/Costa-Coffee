import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi{
  static final _notifications=FlutterLocalNotificationsPlugin();

  static Future showNotification({
  int id=0,
  String? title,
  String? body,
  String? payload
})async=>_notifications.show(id, title, body, await  _notificationDetails(),payload: payload,);

  static Future _notificationDetails()async {
    return const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName', 'channelDescription',importance: Importance.max,icon: 'mipmap/ic_launcher'),
      iOS: IOSNotificationDetails()
    );
  }
  
}