import 'package:flutter/material.dart';

import '../../../../models/blog_tag_model.dart';
import '../../../../utils/utils.dart';

class BlogTagsWidget extends StatefulWidget {
  const BlogTagsWidget({Key? key}) : super(key: key);

  @override
  State<BlogTagsWidget> createState() => _BlogTagsWidgetState();
}

class _BlogTagsWidgetState extends State<BlogTagsWidget> {
  final List<BlogTagModel> items = const [
    BlogTagModel(id: 1, name: 'General', createdAt: '2025-08-08', status: 'Published'),
    BlogTagModel(id: 2, name: 'Design', createdAt: '2025-08-08', status: 'Published'),
    BlogTagModel(id: 3, name: 'Fashion', createdAt: '2025-08-08', status: 'Published'),
    BlogTagModel(id: 4, name: 'Branding', createdAt: '2025-08-08', status: 'Published'),
    BlogTagModel(id: 5, name: 'Modern', createdAt: '2025-08-08', status: 'Published'),
    BlogTagModel(id: 6, name: 'Nature', createdAt: '2025-08-08', status: 'Published'),
    BlogTagModel(id: 7, name: 'Vintage', createdAt: '2025-08-08', status: 'Published'),
    BlogTagModel(id: 8, name: 'Sunglasses', createdAt: '2025-08-08', status: 'Published'),
  ];

  late List<bool> selected;
  bool selectAll = false;

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
        final BlogTagModel item = items[index];
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
            DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
            _buildStatusCell(item.status, context),
            _buildActionButtons(context),
          ],
        );
      }),
    );
  }

  static DataCell _buildStatusCell(String status, BuildContext context) {
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

  static DataCell _buildActionButtons(BuildContext context) {
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


