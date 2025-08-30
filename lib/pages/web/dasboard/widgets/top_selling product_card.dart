import 'package:flutter/material.dart';

import '../../../../../models/product_model.dart';

class ProductRow extends StatelessWidget {
  final ProductModel product;

  const ProductRow({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Image.network(product.imageUrl ?? "", width: 30, height: 30),
                SizedBox(width: 8),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text("ID: ${product.id}", style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("\$${product.currentPrice?.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(width: 6),
                if (product.oldPrice != null)
                  Text(
                    "\$${product.oldPrice!.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                        ),
                  )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              margin: EdgeInsets.only(right: 7),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("Published", style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.green, fontSize: 12)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              product.date ?? "",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
