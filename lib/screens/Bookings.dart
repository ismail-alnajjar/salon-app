import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookings = Cart.bookings;

    return Scaffold(
      appBar: AppBar(
        title: const Text("الحجوزات المؤكدة"),
        backgroundColor: Colors.brown[300],
      ),
      body: bookings.isEmpty
          ? const Center(child: Text("لا توجد حجوزات بعد"))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        booking.image,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      booking.serviceName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${booking.description}\n"
                      "تاريخ الحجز: ${booking.date.toLocal().toString().split(' ')[0]}\n"
                      "الوقت: ${booking.time.format(context)}",
                      style: const TextStyle(fontSize: 13),
                    ),
                    isThreeLine: true,
                    trailing: Text(
                      "${booking.price}\$",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
