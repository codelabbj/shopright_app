import 'package:flutter/material.dart';

class SalesCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String percentage;
  final bool isPositive;
  final String footerText;
  final VoidCallback? onDetailTap;

  const SalesCardWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.percentage,
    required this.isPositive,
    required this.footerText,
    this.onDetailTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color indicatorColor = isPositive ? Colors.green : Colors.red;
    final IconData indicatorIcon = isPositive ? Icons.arrow_upward : Icons.arrow_downward;
    final Color indicatorBg = isPositive ? Colors.green.shade100 : Colors.red.shade100;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.more_vert),
              ],
            ),

            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey),
            ),

            const SizedBox(height: 16),

            // Amount and percentage
            Row(
              children: [
                Text(
                  amount,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: indicatorBg,
                    border: Border.all(color: indicatorBg),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Icon(indicatorIcon, size: 14, color: indicatorColor),
                      const SizedBox(width: 2),
                      Text(
                        percentage,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 10,
                              color: indicatorColor,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Bottom Footer
            InkWell(
              onTap: onDetailTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      footerText,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Text(
                          "See detail",
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 16),
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
