import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salon_app/model/ServecisModel.dart';
import 'package:salon_app/widget/CartProvider.dart';

class CostumCon2 extends ConsumerWidget {
  const CostumCon2({
    super.key,
    required this.Name,
    required this.title1,
    required this.title2,
    required this.title3,
    this.width,
    this.height,
    this.height1,
    this.width1,
    this.onTap,
  });

  final String Name;
  final String title1;
  final String title2;
  final String title3;
  final double? width;
  final double? height;
  final double? height1;
  final double? width1;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        margin: const EdgeInsets.all(10),
        height: height1 ?? height ?? 140,
        width: width1 ?? width ?? double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xffF6D8D8), Color(0xffE9C1C1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 6),
              blurRadius: 12,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(20),
              ),
              child: Image.asset(
                Name,
                width: 110,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title1,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13, height: 1.4),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title3,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // اختيار التاريخ
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                            );
                            if (selectedDate == null) return;

                            // اختيار الوقت
                            TimeOfDay? selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (selectedTime == null) return;

                            // تحقق من وجود الخدمة مسبقًا بنفس التاريخ والوقت
                            bool alreadyBooked = ref
                                .read(cartProvider)
                                .cartItems
                                .any(
                                  (item) =>
                                      item.name == title1 &&
                                      item.date == selectedDate &&
                                      item.time == selectedTime,
                                );

                            if (alreadyBooked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "هذه الخدمة محجوزة بالفعل في هذا الوقت ⚠️",
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              return;
                            }

                            // إنشاء الخدمة
                            Service1 service = Service1(
                              name: title1,
                              description: title2,
                              image: Name,
                              price:
                                  double.tryParse(
                                    title3.replaceAll('\$', ''),
                                  ) ??
                                  0,
                              date: selectedDate,
                              time: selectedTime,
                            );

                            // إضافة الخدمة للسلة
                            ref.read(cartProvider).addService(service);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("تمت الإضافة إلى السلة ✅"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'احجز الآن',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
