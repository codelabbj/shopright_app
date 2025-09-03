import 'package:flutter/material.dart';

import '../../../../models/contact_model.dart';
import '../../../../utils/utils.dart';

class ContactListWidget extends StatefulWidget {
  const ContactListWidget({Key? key}) : super(key: key);

  @override
  State<ContactListWidget> createState() => _ContactListWidgetState();
}

class _ContactListWidgetState extends State<ContactListWidget> {
  final List<ContactModel> items = const [
    ContactModel(id: 10, name: 'Jace Muller', email: 'bcormier@example.org', phone: '1-832-590-8071', createdAt: '2025-08-08', status: 'Read'),
    ContactModel(id: 9, name: 'Alvina Walter III', email: 'christine87@example.com', phone: '+1.870.818.1676', createdAt: '2025-08-08', status: 'Unread'),
    ContactModel(id: 8, name: 'Gayle Koelpin', email: 'sabbott@example.net', phone: '(574) 824-8670', createdAt: '2025-08-08', status: 'Unread'),
    ContactModel(id: 7, name: 'Clemmie Kuhlman', email: 'kyle49@example.net', phone: '+1-626-683-4114', createdAt: '2025-08-08', status: 'Read'),
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
        DataColumn(label: Text('Email')),
        DataColumn(label: Text('Phone')),
        DataColumn(label: Text('Created at')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Operations')),
      ],
      rows: List.generate(items.length, (index) {
        final ContactModel item = items[index];
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
            DataCell(Text(item.email, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.phone, style: Theme.of(context).textTheme.labelSmall)),
            DataCell(Text(item.createdAt, style: Theme.of(context).textTheme.labelSmall)),
            _buildStatusCell(item.status, context),
            _buildActionButtons(context),
          ],
        );
      }),
    );
  }

  static DataCell _buildStatusCell(String status, BuildContext context) {
    Color color = status == 'Read' ? Colors.green : Colors.orange;
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
          )),
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


