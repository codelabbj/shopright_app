import 'package:flutter/material.dart';
import '../../../../models/invoice_row_model.dart';

class InvoicesWidget extends StatefulWidget {
  const InvoicesWidget({super.key});

  @override
  State<InvoicesWidget> createState() => _InvoicesWidgetState();

  static DataCell _statusChip(String status, BuildContext context) {
    Color color = status == 'Completed' ? Colors.green : Colors.orange;
    return DataCell(Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color.withValues(alpha: 0.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(status, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color)),
      ),
    ));
  }
}

class _InvoicesWidgetState extends State<InvoicesWidget> {
  final List<InvoiceRowModel> items = const [
    InvoiceRowModel(
        id: 49,
        name: 'Lolita Casper II',
        orderCode: '#SF-10000049',
        invoiceCode: 'INV-49',
        amount: '\u0000 9,174.00',
        createdAt: '2025-08-08',
        status: 'Completed'),
    InvoiceRowModel(
        id: 48,
        name: 'Lolita Casper II',
        orderCode: '#SF-10000048',
        invoiceCode: 'INV-48',
        amount: '\u0000 4,074.00',
        createdAt: '2025-08-08',
        status: 'Completed'),
    InvoiceRowModel(
        id: 47,
        name: 'Lolita Casper II',
        orderCode: '#SF-10000047',
        invoiceCode: 'INV-47',
        amount: '\u0000 1,262.00',
        createdAt: '2025-08-07',
        status: 'Pending'),
  ];
  List<bool> selected = [];

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
      columns: const [
        DataColumn(label: Text('')),
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Order')),
        DataColumn(label: Text('Code')),
        DataColumn(label: Text('Amount')),
        DataColumn(label: Text('Created at')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Operations')),
      ],
      rows: List.generate(items.length, (index) {
        final item = items[index];
        final isSelected = selected[index];
        return DataRow(cells: [
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
          DataCell(Text(item.id.toString(), style: Theme.of(context).textTheme.labelSmall)),
          DataCell(Text(item.name, style: Theme.of(context).textTheme.labelSmall)),
          DataCell(Text(item.orderCode, style: const TextStyle(color: Colors.blue))),
          DataCell(Text(item.invoiceCode, style: Theme.of(context).textTheme.labelSmall)),
          DataCell(Text(item.amount, style: Theme.of(context).textTheme.labelSmall)),
          DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
          InvoicesWidget._statusChip(item.status, context),
          const DataCell(SizedBox()),
        ]);
      }),
    );
  }
}
