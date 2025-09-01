import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';
import 'package:salon_app/model/Bookingsmodels.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    final items = Cart.items;
    double total = items.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text("سلة الحجوزات"),
        backgroundColor: Colors.brown[300],
      ),
      body: items.isEmpty
          ? const Center(child: Text("السلة فارغة 🛒"))
          : Column(
              children: [
                // قائمة الخدمات في السلة
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final service = items[index];
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
                              service.image,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            service.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "${service.description}\n"
                            "تاريخ الحجز: ${service.date?.toLocal().toString().split(' ')[0] ?? '---'}\n"
                            "الوقت: ${service.time?.format(context) ?? '---'}",
                            style: const TextStyle(fontSize: 13),
                          ),
                          isThreeLine: true,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${service.price}\$",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    items.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // عرض الإجمالي
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.brown[100],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "الإجمالي:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$total\$",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ),

                // زر تأكيد الحجز
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (items.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("السلة فارغة!"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        // تحويل كل Service1 إلى Booking
                        for (var s in items) {
                          if (s.date != null && s.time != null) {
                            Cart.bookings.add(
                              Booking(
                                serviceName: s.name,
                                description: s.description,
                                image: s.image,
                                price: s.price,
                                date: s.date!,
                                time: s.time!,
                                userId: null,
                              ),
                            );
                          }
                        }

                        // تفريغ السلة بعد التأكيد
                        Cart.items.clear();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("تم تأكيد الحجز ✅"),
                            duration: Duration(seconds: 2),
                          ),
                        );

                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "تأكيد الحجز",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
