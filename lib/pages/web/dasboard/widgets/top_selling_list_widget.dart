import 'package:e_com_app/pages/web/dasboard/widgets/top_selling%20product_card.dart';
import 'package:flutter/material.dart';

import '../../../../../models/product_model.dart';

class TopSellingProductsWidget extends StatelessWidget {
  final List<ProductModel> products = [
    ProductModel(
      id: 19,
      name: "Lenovo ThinkPad X1 Carbon...",
      currentPrice: 67.00,
      oldPrice: 609.00,
      imageUrl: "assets/images/footwear.jpg",
      date: "Aug 08, 2025",
    ),
    ProductModel(
      id: 42,
      name: "TCL 6-Series 4K UHD Dolby...",
      currentPrice: 1262.00,
      imageUrl: "assets/images/wallets.webp",
      date: "Aug 08, 2025",
    ),
    ProductModel(
      id: 44,
      name: "Hisense U8G Quantum Serie...",
      currentPrice: 1034.36,
      oldPrice: 1361.00,
      imageUrl: "assets/images/winter_cap.webp",
      date: "Aug 08, 2025",
    ),
    ProductModel(
      id: 46,
      name: "Samsung QN85A Neo QLED 4K...",
      currentPrice: 2448.00,
      imageUrl: "assets/images/winter_hooby.webp",
      date: "Aug 08, 2025",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.trending_up, color: Colors.blue),
            title: Text("Top Selling Products", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300]!)),
            child: Row(
              children: [
                Expanded(flex: 4, child: Text("Name", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
                Expanded(flex: 3, child: Text("Price", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
                Expanded(flex: 2, child: Text("Status", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
                Expanded(flex: 3, child: Text("Created At", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          ...products.map((product) => ProductRow(product: product)).toList(),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text("View Full Products", style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.blue)),
            ),
          )
        ],
      ),
    );
  }
}
