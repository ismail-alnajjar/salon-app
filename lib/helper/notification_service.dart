import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  // إرسال إشعار أساسي
  static Future<void> showBasicNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'إشعار من تطبيق الصالون 💇‍♀️',
        body: 'هذا إشعار تجريبي للتأكد أن كل شيء يعمل ✅',
      ),
    );
  }

  // إرسال إشعار بجدول (بعد 5 ثواني مثلًا)
  static Future<void> showScheduledNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        channelKey: 'basic_channel',
        title: 'تذكير بالموعد ⏰',
        body: 'لا تنسى حجز موعدك في الصالون!',
      ),
      schedule: NotificationCalendar(
        second: DateTime.now().second + 5,
        repeats: false,
      ),
    );
  }
}
