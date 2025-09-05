import 'package:flutter/material.dart';

import '../../../../models/product_tag_model.dart';

class ProductTagsWidget extends StatefulWidget {
  const ProductTagsWidget({super.key});

  @override
  State<ProductTagsWidget> createState() => _ProductTagsWidgetState();
}

class _ProductTagsWidgetState extends State<ProductTagsWidget> {
  final List<ProductTagModel> items = const [
    ProductTagModel(id: 6, name: 'IT', status: 'Published', createdAt: '2025-08-08'),
    ProductTagModel(id: 5, name: 'Office', status: 'Published', createdAt: '2025-08-08'),
    ProductTagModel(id: 4, name: 'Printer', status: 'Published', createdAt: '2025-08-08'),
    ProductTagModel(id: 3, name: 'Iphone', status: 'Published', createdAt: '2025-08-08'),
    ProductTagModel(id: 2, name: 'Mobile', status: 'Published', createdAt: '2025-08-08'),
    ProductTagModel(id: 1, name: 'Electronic', status: 'Published', createdAt: '2025-08-08'),
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
        DataColumn(label: Text('Name')),
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
                onChanged: (val) => setState(() => selected[index] = val!),
              ),
            )),
            DataCell(Text(item.id.toString(), style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.name, style: Theme.of(context).textTheme.labelSmall)),
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
