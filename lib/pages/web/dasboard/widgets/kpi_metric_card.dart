import 'package:flutter/material.dart';

class KpiMetricCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String value;
  final String delta;

  const KpiMetricCard({super.key, required this.icon, required this.iconBg, required this.title, required this.value, required this.delta});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.dividerColor),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: iconBg.withOpacity(0.15), borderRadius: BorderRadius.circular(8)),
          alignment: Alignment.center,
          child: Icon(icon, color: iconBg),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: theme.textTheme.displaySmall),
            const SizedBox(height: 4),
            Text(value, style: theme.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(delta, style: theme.textTheme.displaySmall!.copyWith(color: Colors.red)),
          ]),
        ),
      ]),
    );
  }
}


