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
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    return Card(
      color: theme.cardColor,
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isLight ? const Color(0xFFF5F7FA) : theme.colorScheme.surface,
              border: Border.all(color: theme.dividerColor),
            ),
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
