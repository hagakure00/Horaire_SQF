import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');

  void initialNotification () async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification () async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
        "channelId",
        "channelName",
      importance: Importance.max,
      priority: Priority.max,
      icon: '@mipmap/ic_launcher'
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        'Horaire',
        'N\'oublier pas de notifier vos heures de la journée !!!',
        RepeatInterval.daily,
        notificationDetails
    );
  }

}