import 'package:flutter/material.dart';

import '../../../../models/faq_category_model.dart';
import '../../../../utils/utils.dart';

class FaqCategoriesWidget extends StatefulWidget {
  const FaqCategoriesWidget({Key? key}) : super(key: key);

  @override
  State<FaqCategoriesWidget> createState() => _FaqCategoriesWidgetState();
}

class _FaqCategoriesWidgetState extends State<FaqCategoriesWidget> {
  final List<FaqCategoryModel> items = const [
    FaqCategoryModel(id: 3, name: 'Order & Returns', createdAt: '2025-08-08', status: 'Published'),
    FaqCategoryModel(id: 2, name: 'Payment', createdAt: '2025-08-08', status: 'Published'),
    FaqCategoryModel(id: 1, name: 'Shipping', createdAt: '2025-08-08', status: 'Published'),
  ];

  late List<bool> selected;

  @override
  void initState() {
    super.initState();
    selected = List<bool>.generate(items.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 12,
      headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
      columns: const [
        DataColumn(label: SizedBox.shrink()),
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Created at')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Operations')),
      ],
      rows: List.generate(items.length, (index) {
        final item = items[index];
        final bool isSelected = selected[index];
        return DataRow(
          selected: isSelected,
          color: MaterialStateProperty.resolveWith<Color?>((states) => isSelected ? Colors.blue[100] : null),
          cells: [
            DataCell(
              Transform.scale(
                scale: 0.7,
                child: Checkbox(
                  value: isSelected,
                  side: BorderSide(color: Colors.grey[500]!),
                  onChanged: (val) => setState(() => selected[index] = val ?? false),
                ),
              ),
            ),
            DataCell(Text(item.id.toString(), style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.name, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
            _statusCell(item.status, context),
            _actionCell(context),
          ],
        );
      }),
    );
  }

  static DataCell _statusCell(String status, BuildContext context) {
    final Color color = Colors.green;
    return DataCell(Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color.withValues(alpha: 0.2)),
      child: SizedBox(
        width: 94,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: [
              Icon(Icons.circle, size: 10, color: color),
              const SizedBox(width: 2),
              Expanded(child: Text(status, style: Theme.of(context).textTheme.labelSmall)),
            ],
          ),
        ),
      ),
    ));
  }

  static DataCell _actionCell(BuildContext context) {
    return DataCell(
      IconButton(
        icon: Row(
          children: [
            Image.asset('assets/images/supprimer.png', width: 15, height: 15, color: Colors.red),
            const SizedBox(width: 5),
            Text('Delete', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.red)),
          ],
        ),
        onPressed: () => Utils.showDeleteDialog(context),
      ),
    );
  }
}


