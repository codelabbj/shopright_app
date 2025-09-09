import 'package:flutter/material.dart';

class PaymentLogsWidget extends StatelessWidget {
  const PaymentLogsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return DataTable(
      columnSpacing: 12,
      // headingRowColor: MaterialStateProperty.all(isLight ? const Color(0xFFF5F7FA) : null),
      dividerThickness: 0,
      columns: const [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Payment method')),
        DataColumn(label: Text('IP address')),
        DataColumn(label: Text('Created at')),
        DataColumn(label: Text('Operations')),
      ],
      rows: [
        DataRow(color: MaterialStateProperty.all(isLight ? const Color(0xFFF8FAFC) : null), cells: [
          DataCell(Text('1', style: Theme.of(context).textTheme.labelSmall)),
          DataCell(Text('Stripe', style: Theme.of(context).textTheme.labelSmall)),
          DataCell(Text('162.158.108.91', style: Theme.of(context).textTheme.labelSmall)),
          DataCell(Text('2025-09-09 09:27:37', style: Theme.of(context).textTheme.labelSmall)),
          DataCell(Row(children: const [
            Icon(Icons.visibility, size: 18),
            SizedBox(width: 6),
            Icon(Icons.delete, color: Colors.red, size: 18),
          ])),
        ]),
      ],
    );
  }
}
