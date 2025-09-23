// lib/screens/booking_page.dart
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salon_app/widget/CartProvider.dart';

class BookingPage extends ConsumerWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(cartProvider).cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text("سلة الحجوزات"),
        backgroundColor: Colors.brown[300],
      ),
      body: items.isEmpty
          ? const Center(child: Text("السلة فارغة 🛒"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final s = items[index];
                      return ListTile(
                        leading: Image.asset(s.image, width: 60, height: 60),
                        title: Text(s.name),
                        subtitle: Text(
                          "تاريخ: ${s.date!.toLocal().toString().split(' ')[0]}\n"
                          "الوقت: ${s.time!.format(context)}",
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("${s.price}\$"),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                ref.read(cartProvider).removeService(s);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "${s.name} تمت إزالته من السلة",
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[400],
                      ),
                      onPressed: () async {
                        try {
                          // نسخ العناصر لإنشاء الإشعارات قبل مسح السلة
                          final itemsToNotify = List.of(items);

                          // حفظ الحجوزات في Firestore ومسح السلة
                          await ref.read(cartProvider).confirmBooking();

                          // التأكد من إذن الإشعارات
                          bool isAllowed = await AwesomeNotifications()
                              .isNotificationAllowed();
                          if (!isAllowed) {
                            isAllowed = await AwesomeNotifications()
                                .requestPermissionToSendNotifications();
                          }

                          if (isAllowed) {
                            for (var s in itemsToNotify) {
                              // إشعار تجريبي بعد 10 ثواني

                              // إشعار حقيقي قبل الموعد بنصف ساعة
                              final DateTime bookingDateTime = DateTime(
                                s.date!.year,
                                s.date!.month,
                                s.date!.day,
                                s.time!.hour,
                                s.time!.minute,
                              );
                              final DateTime realReminder = bookingDateTime
                                  .subtract(const Duration(minutes: 30));

                              if (realReminder.isAfter(DateTime.now())) {
                                AwesomeNotifications().createNotification(
                                  content: NotificationContent(
                                    id: s.hashCode + 1000,
                                    channelKey: 'basic_channel',
                                    title: '⏰ تذكير بالحجز',
                                    body:
                                        'موعدك للخدمة ${s.name} الساعة ${s.time!.format(context)}',
                                  ),
                                  schedule: NotificationCalendar.fromDate(
                                    date: realReminder,
                                  ),
                                );
                              }
                            }
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("تم تأكيد الحجز ✅")),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("خطأ أثناء الحفظ: $e")),
                          );
                        }
                      },
                      child: const Text(
                        "تأكيد الحجز",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
