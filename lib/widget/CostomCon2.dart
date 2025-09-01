import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';
import 'package:salon_app/model/ServecisModel.dart';

class CostumCon2 extends StatelessWidget {
  const CostumCon2({
    super.key,
    required this.Name,
    required this.title1,
    required this.title2,
    required this.title3,
    this.width,
    this.onTap,
    this.height,
    this.height1,
    this.width1,
  });

  final String Name;
  final String title1;
  final String title2;
  final String title3;
  final double? width;
  final VoidCallback? onTap;
  final double? height;
  final double? height1;
  final double? width1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        margin: const EdgeInsets.all(10),
        height: height1 ?? height ?? 140,
        width: width1 ?? width ?? double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xffF6D8D8), const Color(0xffE9C1C1)],
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
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                            );
                            if (selectedDate == null) return;

                            TimeOfDay? selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (selectedTime == null) return;

                            bool alreadyAdded = Cart.items.any(
                              (item) =>
                                  item.name == title1 &&
                                  item.date == selectedDate &&
                                  item.time == selectedTime,
                            );

                            if (alreadyAdded) {
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

                            Cart.items.add(
                              Service1(
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
                              ),
                            );

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
