import 'package:flutter/material.dart';

import '../../../../models/flash_sale_model.dart';

class FlashSalesWidget extends StatefulWidget {
  const FlashSalesWidget({super.key});

  @override
  State<FlashSalesWidget> createState() => _FlashSalesWidgetState();
}

class _FlashSalesWidgetState extends State<FlashSalesWidget> {
  final List<FlashSaleModel> items = const [
    FlashSaleModel(id: 1, name: 'Winter Sale', endDate: '2025-11-27', createdAt: '2025-08-08', status: 'Published'),
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
      columns: const [
        DataColumn(label: SizedBox()),
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('End Date')),
        DataColumn(label: Text('Created at')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Operations')),
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
            DataCell(Text(item.name, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.endDate, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.green.withValues(alpha: 0.2)),
              child: SizedBox(
                width: 94,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(children: [
                    const Icon(Icons.circle, size: 10, color: Colors.green),
                    const SizedBox(width: 2),
                    Expanded(child: Text(item.status, style: Theme.of(context).textTheme.labelSmall)),
                  ]),
                ),
              ),
            )),
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
}


