import 'package:flutter/material.dart';
import '../../../../../models/order_return_model.dart';

class OrdersReturnsWidget extends StatefulWidget {
  const OrdersReturnsWidget({super.key});

  @override
  State<OrdersReturnsWidget> createState() => _OrdersReturnsWidgetState();
}

class _OrdersReturnsWidgetState extends State<OrdersReturnsWidget> {
  final List<OrderReturnModel> items = const [
    OrderReturnModel(
      id: 1,
      orderId: '#SF-10000049',
      customerName: 'Lolita Casper II',
      customerEmail: 'lula30@example.net',
      productItems: '1 item',
      reason: 'Damaged product',
      status: 'Pending',
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
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Order ID')),
        DataColumn(label: Text('Customer')),
        DataColumn(label: Text('Product Item(s)')),
        DataColumn(label: Text('Return Reason')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Created at')),
        DataColumn(label: Text('Operations')),
      ],
      rows: items.isEmpty
          ? [
              DataRow(
                cells: List.generate(9, (index) {
                  if (index == 3) {
                    return DataCell(
                      Container(
                        height: 80,
                        alignment: Alignment.center,
                        child: Text(
                          'No data to display',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
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
                selected: isSelected,
                color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                  if (isSelected) return Colors.blue[100];
                  return null;
                }),
                cells: [
                  DataCell(
                    Transform.scale(
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
                    ),
                  ),
                  DataCell(Text(item.id.toString(), style: Theme.of(context).textTheme.labelSmall)),
                  DataCell(Text(item.orderId, style: const TextStyle(color: Colors.blue))),
                  DataCell(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item.customerName, style: Theme.of(context).textTheme.labelSmall!),
                      Text(item.customerEmail, style: Theme.of(context).textTheme.labelSmall!),
                    ],
                  )),
                  DataCell(Text(item.productItems, style: Theme.of(context).textTheme.labelSmall)),
                  DataCell(Text(item.reason, style: Theme.of(context).textTheme.labelSmall)),
                  DataCell(Text(item.status, style: Theme.of(context).textTheme.labelSmall)),
                  DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
                  _buildActionButtons(context)
                ],
              );
            }),
    );
  }

  static DataCell _buildActionButtons(context) {
    return DataCell(
      Row(
        children: [
          IconButton(
            icon: Row(
              children: [
                Image.asset(
                  "assets/images/editer.png",
                  width: 15,
                  height: 15,
                ),
                SizedBox(width: 5),
                Text("Edit", style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Row(
              children: [
                Image.asset(
                  "assets/images/supprimer.png",
                  width: 15,
                  height: 15,
                  color: Colors.red,
                ),
                SizedBox(width: 5),
                Text(
                  "Delete",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.red),
                ),
              ],
            ),
            onPressed: () {
              // Action delete
            },
          ),
        ],
      ),
    );
  }
}
