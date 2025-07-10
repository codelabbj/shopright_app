import 'package:flutter/material.dart';

import '../../../constantes/const.dart';

class CardProductWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String size;
  final double unitPrice;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CardProductWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.size,
    required this.unitPrice,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imageUrl, width: 60, height: 60, fit: BoxFit.cover),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Size: $size", style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey)),
                Text("1x \$${unitPrice.toStringAsFixed(2)} USD", style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey[700])),
              ],
            ),
          ),
          SizedBox(
            height: Const.screenHeight(context) * 0.1,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: Column(
                children: [
                  InkWell(onTap: onRemove, child: Icon(Icons.remove_circle_outline)),
                  // IconButton(icon: Icon(), onPressed: onRemove),
                  Text(
                    quantity.toString(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  InkWell(onTap: onAdd, child: Icon(Icons.add_circle_outline))
                  // IconButton(icon: Icon(), onPressed: onAdd),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
