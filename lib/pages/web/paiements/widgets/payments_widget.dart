import 'package:flutter/material.dart';

class PaymentsWidget extends StatefulWidget {
  const PaymentsWidget({super.key});

  @override
  State<PaymentsWidget> createState() => _PaymentsWidgetState();
}

class _PaymentsWidgetState extends State<PaymentsWidget> {
  final List<Map<String, String>> rows = const [
    {
      'id': '52',
      'chargeId': 'SZE3CJL3BS',
      'payer': 'Shea Batz',
      'amount': '279.00 USD',
      'channel': 'Bank transfer',
      'status': 'Pending',
      'createdAt': '2025-09-09',
    },
    {
      'id': '49',
      'chargeId': 'JAXEXQVHDD',
      'payer': 'Lolita Casper II',
      'amount': '9174.00 USD',
      'channel': 'SslCommerz',
      'status': 'Completed',
      'createdAt': '2025-08-08',
    },
  ];

  late List<bool> selected;
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    selected = List.generate(rows.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return DataTable(
      columnSpacing: 12,
      // headingRowColor: MaterialStateProperty.all(isLight ? const Color(0xFFF5F7FA) : null),
      dividerThickness: 0,
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
        DataColumn(label: Text('Charge ID')),
        DataColumn(label: Text('Payer name')),
        DataColumn(label: Text('Amount')),
        DataColumn(label: Text('Payment Channel')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Created at')),
        DataColumn(label: Text('Operations')),
      ],
      rows: List<DataRow>.generate(rows.length, (index) {
        final r = rows[index];
        final isSelected = selected[index];
        return DataRow(
          selected: isSelected,
          color: MaterialStateProperty.resolveWith((states) {
            if (isSelected) return Colors.blue[100];
            if (isLight && index % 2 == 0) return const Color(0xFFF8FAFC);
            return null;
          }),
          cells: [
            DataCell(Transform.scale(
              scale: 0.7,
              child: Checkbox(
                value: isSelected,
                side: BorderSide(color: Colors.grey[500]!),
                onChanged: (val) => setState(() {
                  selected[index] = val ?? false;
                  selectAll = selected.every((s) => s);
                }),
              ),
            )),
            DataCell(Text(r['id']!, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(r['chargeId']!, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.blue))),
            DataCell(Text(r['payer']!, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(r['amount']!, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(r['channel']!, style: Theme.of(context).textTheme.labelSmall)),
            _statusPill(r['status']!, context),
            DataCell(Text(r['createdAt']!, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Row(children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit, size: 18)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete, color: Colors.red, size: 18)),
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
        color = Colors.green;
        break;
      case 'pending':
        color = Colors.orange;
        break;
      default:
        color = Theme.of(context).colorScheme.primary;
    }
    return DataCell(Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color.withValues(alpha: 0.2)),
      child: SizedBox(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(children: [
            Icon(Icons.circle, size: 10, color: color),
            const SizedBox(width: 4),
            Expanded(child: Text(status, style: Theme.of(context).textTheme.labelSmall)),
          ]),
        ),
      ),
    ));
  }
}
