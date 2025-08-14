import 'package:e_com_app/pages/web/dasboard/widgets/top_selling.dart';
import 'package:flutter/material.dart';

class TopSellingList extends StatelessWidget {
  const TopSellingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Top Selling Product", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            TopSellingProductCard(name: "Nike Air Max 270", items: "3,250 item", price: "\$52,392"),
            TopSellingProductCard(name: "Zara Oversized Jacket", items: "3,000 item", price: "\$40,635"),
            TopSellingProductCard(name: "Uniqlo Heattech Socks", items: "2,750 item", price: "\$35,234"),
            TopSellingProductCard(name: "Black Short Sleeve", items: "2,500 item", price: "\$32,987"),
          ],
        ),
      ),
    );
  }
}
