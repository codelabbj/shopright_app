import 'package:flutter/material.dart';
import '../../../../models/shipment_model.dart';

class ShipmentsWidget extends StatefulWidget {
  const ShipmentsWidget({super.key});

  @override
  State<ShipmentsWidget> createState() => _ShipmentsWidgetState();
}

class _ShipmentsWidgetState extends State<ShipmentsWidget> {
  late List<ShipmentModel> items = const [
    ShipmentModel(
      id: 42,
      orderCode: '#SF-10000049',
      customerName: 'Lolita Casper II',
      customerEmail: 'lula30@example.net',
      phone: '+12549704152',
      shippingAmount: '0.00',
      status: 'Delivered',
      codStatus: 'Not available',
      createdAt: '2025-08-08',
    ),
    ShipmentModel(
      id: 41,
      orderCode: '#SF-10000048',
      customerName: 'Lolita Casper II',
      customerEmail: 'lula30@example.net',
      phone: '+12549704152',
      shippingAmount: '0.00',
      status: 'Delivered',
      codStatus: 'Not available',
      createdAt: '2025-08-08',
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
      dataRowMaxHeight: 80,
      headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
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
        const DataColumn(label: Text('Order ID')),
        const DataColumn(label: Text('Customer')),
        const DataColumn(label: Text('Shipping Amount')),
        const DataColumn(label: Text('Status')),
        const DataColumn(label: Text('COD Status')),
        const DataColumn(label: Text('Created at')),
        const DataColumn(label: Text('Operations')),
      ],
      rows: items.isEmpty
          ? [
              DataRow(
                cells: List.generate(9, (index) {
                  if (index == 3) {
                    return DataCell(
                      Center(
                        child: Text(
                          'No data to display',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.grey[600],
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ),
                    );
                  } else {
                    return const DataCell(SizedBox());
                  }
                }),
              ),
            ]
          : List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = selected[index];
              return DataRow(
                selected: selected[index],
                onSelectChanged: (bool? value) {
                  setState(() {
                    selected[index] = value ?? false;
                    selectAll = selected.every((v) => v);
                  });
                },
                cells: [
                  DataCell(
                    Transform.scale(
                      scale: 0.7,
                      child: Checkbox(
                        value: isSelected,
                        side: BorderSide(color: Colors.grey[500]!),
                        onChanged: (val) {
                          setState(() {
                            selected[index] = val ?? false;
                            selectAll = selected.every((s) => s);
                          });
                        },
                      ),
                    ),
                  ),
                  DataCell(Text(item.id.toString(),
                      style: Theme.of(context).textTheme.labelSmall)),
                  DataCell(Text(item.orderCode,
                      style: const TextStyle(color: Colors.blue))),
                  DataCell(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item.customerName,
                          style: Theme.of(context).textTheme.labelSmall!),
                      Text(item.customerEmail,
                          style: Theme.of(context).textTheme.labelSmall!),
                      Text(item.phone,
                          style: Theme.of(context).textTheme.labelSmall!),
                    ],
                  )),
                  DataCell(Text(item.shippingAmount,
                      style: Theme.of(context).textTheme.labelSmall)),
                  _chip(item.status, context),
                  _blueChip(item.codStatus, context),
                  DataCell(Text(item.createdAt,
                      style: Theme.of(context).textTheme.labelSmall)),
                  _buildActionButtons(context),
                ],
              );
            }),
    );
  }

  static DataCell _chip(String status, BuildContext context) {
    Color color = status == 'Delivered' ? Colors.green : Colors.orange;
    return DataCell(Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(status,
            style:
                Theme.of(context).textTheme.labelSmall?.copyWith(color: color)),
      ),
    ));
  }

  static DataCell _blueChip(String text, BuildContext context) {
    final color = Colors.blue;
    return DataCell(Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(text,
            style:
                Theme.of(context).textTheme.labelSmall?.copyWith(color: color)),
      ),
    ));
  }

  static DataCell _buildActionButtons(BuildContext context) {
    return DataCell(
      Row(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Image.asset("assets/images/editer.png", width: 15, height: 15),
                const SizedBox(width: 5),
                Text("Edit", style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: () {
              // Delete action
            },
            child: Row(
              children: [
                Image.asset("assets/images/supprimer.png",
                    width: 15, height: 15, color: Colors.red),
                const SizedBox(width: 5),
                Text("Delete",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: Colors.red)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
