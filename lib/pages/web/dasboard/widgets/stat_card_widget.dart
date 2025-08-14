import 'package:flutter/material.dart';

class StatCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final String percentage;
  final bool isPositive;

  const StatCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.percentage,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 8),
            Text(value, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(
              percentage,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: isPositive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
