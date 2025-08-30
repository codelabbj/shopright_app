import 'package:flutter/material.dart';

import '../../../../models/order_model.dart';

class OrderRow extends StatelessWidget {
  final OrderModel order;

  const OrderRow({Key? key, required this.order}) : super(key: key);

  Color _statusColor() {
    switch (order.status) {
      case "Completed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ORDER
          Expanded(
            flex: 3,
            child: Text(
              order.reference ?? "",
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // DATE
          Expanded(
            flex: 3,
            child: Text(order.date ?? "", style: Theme.of(context).textTheme.labelSmall),
          ),

          // CUSTOMER
          Expanded(
            flex: 3,
            child: Text(order.customer ?? "", style: Theme.of(context).textTheme.labelSmall),
          ),

          // STATUS
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(right: 11),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _statusColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                order.status,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: _statusColor(),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
              ),
            ),
          ),

          // TOTAL
          Expanded(
            flex: 3,
            child: Text(
              "\$${order.total}",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
