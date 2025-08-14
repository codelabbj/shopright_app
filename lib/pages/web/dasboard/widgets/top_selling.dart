import 'package:flutter/material.dart';

class TopSellingProductCard extends StatelessWidget {
  final String name;
  final String items;
  final String price;

  const TopSellingProductCard({
    super.key,
    required this.name,
    required this.items,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
              Text(items, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey)),
            ],
          ),
          Text(price, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
