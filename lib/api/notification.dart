import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final _notification = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'description',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  Future<void> initialize() async {
    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/launch_background.xml');

    final InitializationSettings initializationSettings =
        InitializationSettings(
            iOS: iosInitializationSettings,
            android: androidInitializationSettings);
    await _notification.initialize(
      initializationSettings,
      onSelectNotification: onSelectedNotification,
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notification.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('$id');
  }

  void onSelectedNotification(String? payload) {
    print('$payload');
  }
}
