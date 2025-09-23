import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salon_app/model/ServecisModel.dart';
import 'package:salon_app/widget/CartProvider.dart';

class Servecis extends ConsumerWidget {
  final String title;
  final String image;
  final String description;
  final List<Map<String, String>> services;

  const Servecis({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.services,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            ...services.map((service) {
              return ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.pink),
                title: Text(service["name"]!),
                subtitle: Text("Duration: ${service["time"]}"),
                trailing: Text("\$${service["price"]}"),
              );
            }),
            const SizedBox(height: 12),
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
                  final firstService = services.first;

                  ref
                      .read(cartProvider)
                      .addService(
                        Service1(
                          name: firstService["name"]!,
                          description: description,
                          image: image,
                          price: double.parse(firstService["price"]!),
                          date: DateTime.now(),
                          time: TimeOfDay.now(),
                        ),
                      );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("تم إضافة الخدمة للسلة ✅")),
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
