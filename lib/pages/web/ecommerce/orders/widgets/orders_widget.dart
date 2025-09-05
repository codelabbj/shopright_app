import 'package:flutter/material.dart';

import '../../../../../models/order_list_item_model.dart';
import '../../../../../theme/app_colors.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({super.key});

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  final List<OrderListItemModel> items = const [
    OrderListItemModel(
      id: 49,
      customerName: 'Lolita Casper II',
      customerEmail: 'lula30@example.net',
      phone: '+12549704152',
      amount: '\$9,174.00',
      paymentMethod: 'SslCommerz',
      paymentStatus: 'Completed',
      status: 'Completed',
      taxAmount: '\$0.00',
      shippingAmount: '\$0.00',
      createdAt: '2025-08-08',
      store: 'GoPro',
    ),
    OrderListItemModel(
      id: 48,
      customerName: 'Lolita Casper II',
      customerEmail: 'lula30@example.net',
      phone: '+12549704152',
      amount: '\$4,074.00',
      paymentMethod: 'Razorpay',
      paymentStatus: 'Completed',
      status: 'Completed',
      taxAmount: '\$0.00',
      shippingAmount: '\$0.00',
      createdAt: '2025-08-08',
      store: 'Stouffer',
    ),
  ];

  late List<bool> selected;
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    selected = List.generate(items.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 12,
      headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
      dataRowMaxHeight: 80,
      columns: [
        DataColumn(
          label: Transform.scale(
            scale: 0.7,
            child: Checkbox(
              value: selectAll,
              side: BorderSide(color: Colors.grey[500]!),
              onChanged: (value) {
                setState(() {
                  selectAll = value!;
                  for (int i = 0; i < selected.length; i++) {
                    selected[i] = selectAll;
                  }
                });
              },
            ),
          ),
        ),
        const DataColumn(label: Text('ID')),
        const DataColumn(label: Text('Email')),
        const DataColumn(label: Text('Amount')),
        const DataColumn(label: Text('Payment Method')),
        const DataColumn(label: Text('Payment Status')),
        const DataColumn(label: Text('Status')),
        const DataColumn(label: Text('Tax Amount')),
        const DataColumn(label: Text('Shipping Amount')),
        const DataColumn(label: Text('Created at')),
        const DataColumn(label: Text('Store')),
        const DataColumn(label: Text('Operations')),
      ],
      rows: List.generate(items.length, (index) {
        final item = items[index];
        final isSelected = selected[index];
        return DataRow(
          selected: isSelected,
          color: MaterialStateProperty.resolveWith<Color?>((states) => isSelected ? Colors.blue[100] : null),
          cells: [
            DataCell(Transform.scale(
              scale: 0.7,
              child: Checkbox(
                value: isSelected,
                side: BorderSide(color: Colors.grey[500]!),
                onChanged: (val) {
                  setState(() {
                    selected[index] = val!;
                    selectAll = selected.every((s) => s);
                  });
                },
              ),
            )),
            DataCell(Text(item.id.toString(), style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(item.customerName, style: Theme.of(context).textTheme.labelSmall!),
              Text(item.customerEmail, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.PRIMARY_BLUE_COLOR)),
              Text(item.phone, style: Theme.of(context).textTheme.labelSmall!),
            ])),
            DataCell(Text(item.amount, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.paymentMethod, style: Theme.of(context).textTheme.labelSmall)),
            _statusPill(item.paymentStatus, context),
            _statusPill(item.status, context),
            DataCell(Text(item.taxAmount, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.shippingAmount, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.store, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.blue))),
            DataCell(Row(children: [
              IconButton(
                icon: Row(children: [
                  Image.asset('assets/images/editer.png', width: 15, height: 15),
                  const SizedBox(width: 5),
                  Text('Edit', style: Theme.of(context).textTheme.displaySmall),
                ]),
                onPressed: () {},
              ),
              IconButton(
                icon: Row(children: [
                  Image.asset('assets/images/supprimer.png', width: 15, height: 15, color: Colors.red),
                  const SizedBox(width: 5),
                  Text('Delete', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.red)),
                ]),
                onPressed: () {},
              ),
            ])),
          ],
        );
      }),
    );
  }

  static DataCell _statusPill(String status, BuildContext context) {
    Color color;
    switch (status.toLowerCase()) {
      case 'completed':
      case 'complete':
        color = Colors.green;
        break;
      case 'pending':
        color = Colors.orange;
        break;
      default:
        color = Colors.blue;
    }
    return DataCell(Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color.withValues(alpha: 0.2)),
        child: SizedBox(
            width: 110,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(children: [
                  Icon(Icons.circle, size: 10, color: color),
                  const SizedBox(width: 2),
                  Expanded(child: Text(status, style: Theme.of(context).textTheme.labelSmall)),
                ])))));
  }
}
