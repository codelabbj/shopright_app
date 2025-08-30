import 'package:flutter/material.dart';

import '../../../../models/order_model.dart';
import 'oders_row.dart';

class RecentOrdersWidget extends StatelessWidget {
  final List<OrderModel> orders = [
    OrderModel(reference: "#SF-10000049", date: "Aug 08, 2025", customer: "Lolita Casper II", status: "Completed", total: "9174.00"),
    OrderModel(reference: "#SF-10000041", date: "Aug 08, 2025", customer: "Lila DuBuque", status: "Pending", total: "4083.00"),
    OrderModel(reference: "#SF-10000043", date: "Aug 07, 2025", customer: "Shea Batz", status: "Completed", total: "2524.00"),
    OrderModel(reference: "#SF-10000047", date: "Aug 07, 2025", customer: "Lolita Casper II", status: "Pending", total: "1262.00"),
    OrderModel(reference: "#SF-10000023", date: "Aug 07, 2025", customer: "Lolita Casper II", status: "Completed", total: "3271.00"),
    OrderModel(reference: "#SF-10000020", date: "Aug 06, 2025", customer: "Shea Batz", status: "Completed", total: "3786.00"),
    OrderModel(reference: "#SF-10000010", date: "Aug 06, 2025", customer: "Shea Batz", status: "Completed", total: "1108.00"),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          // Header
          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
            title: Text(
              "Recent Orders",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300]!)),
            child: Row(
              children: [
                Expanded(flex: 3, child: Text("Order", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
                Expanded(flex: 3, child: Text("Date", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
                Expanded(flex: 3, child: Text("Customer", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
                Expanded(flex: 3, child: Text("Status", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
                Expanded(flex: 3, child: Text("Total", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
              ],
            ),
          ),

          // Rows
          ...orders.map((order) => OrderRow(order: order)).toList(),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "View All Orders",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
