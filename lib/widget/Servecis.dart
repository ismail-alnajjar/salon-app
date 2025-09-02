import 'package:flutter/material.dart';
import 'package:salon_app/model/ServecisModel.dart';

class Servecis extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final List<Map<String, String>> services;
  final Function(Service1) onBookNow; // 👈 callback

  const Servecis({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.services,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),

            // العنوان
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // الوصف
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 16),

            // قائمة الخدمات
            ...services.map((service) {
              return ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.pink),
                title: Text(service["name"]!),
                subtitle: Text("Duration: ${service["time"]}"),
                trailing: Text("\$${service["price"]}"),
              );
            }),

            const SizedBox(height: 12),

            // زر الحجز
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // نختار الخدمة الأولى (مثلاً) أو نعدل بحيث يختار المستخدم
                  final firstService = services.first;

                  onBookNow(
                    Service1(
                      name: firstService["name"]!,
                      description: description,
                      image: image,
                      price: double.parse(firstService["price"]!),
                      date: DateTime.now(), // مبدئياً
                      time: TimeOfDay.now(), // مبدئياً
                    ),
                  );
                },
                child: const Text(
                  "Book Now",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
