import 'package:flutter/material.dart';

class StatCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final String? percentage;
  final bool? isPositive;
  String? imageUrl;
  Color? color;

  StatCardWidget({super.key, required this.title, required this.value, this.subtitle, this.percentage, this.isPositive, this.color, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              right: 10,
              child: Opacity(
                opacity: 0.2, // transparence
                child: Image.asset(
                  '$imageUrl', // Remplace par ton image
                  width: 60,
                  height: 60,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                        )),
                const SizedBox(height: 8),
                Text(value,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                const SizedBox(height: 4),
                Text(subtitle ?? "",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.white,
                        )),
                const SizedBox(height: 8),
                // Text(
                //   percentage,
                //   style: Theme.of(context).textTheme.labelSmall!.copyWith(
                //         color: isPositive ? Colors.green : Colors.red,
                //         fontWeight: FontWeight.bold,
                //       ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
