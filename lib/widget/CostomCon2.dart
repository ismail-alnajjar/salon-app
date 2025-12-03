import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salon_app/helper/static1.dart'; // للتأكد من وجود isDarkMode
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
          color: isDarkMode
              ? const Color.fromARGB(255, 168, 106, 106).withOpacity(0.3)
              : const Color.fromARGB(255, 218, 163, 163).withOpacity(0.99),
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
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
                            // إظهار مؤشر تحميل أثناء اختيار التاريخ والوقت
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );

                            // اختيار التاريخ
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                            );

                            if (selectedDate == null) {
                              Navigator.pop(context);
                              return;
                            }

                            // اختيار الوقت
                            TimeOfDay? selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            Navigator.pop(context); // إخفاء التحميل

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
