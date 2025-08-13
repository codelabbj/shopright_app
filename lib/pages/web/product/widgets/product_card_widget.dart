import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final double price;
  final String stockStatus;
  final VoidCallback? onMorePressed;

  const ProductCardWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.price,
    required this.stockStatus,
    this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Définition des styles selon le stockStatus
    final Map<String, Map<String, dynamic>> statusStyles = {
      "sold_out": {
        "text": "• Sold Out",
        "textColor": Colors.red,
        "bgColor": Colors.red.shade50,
      },
      "low_stock": {
        "text": "• Low Stock",
        "textColor": Colors.orange,
        "bgColor": Colors.orange.shade50,
      },
      "in_stock": {
        "text": "• In Stock",
        "textColor": Colors.green,
        "bgColor": Colors.green.shade50,
      },
    };

    final style = statusStyles[stockStatus.toLowerCase()];

    return Container(
      width: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image du produit
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),

          // Titre et prix
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "\$${price.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            category,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Colors.grey.shade600, fontSize: 12),
          ),

          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (style != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: style["bgColor"],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    style["text"],
                    style: TextStyle(
                      color: style["textColor"],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              IconButton(
                onPressed: onMorePressed,
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
