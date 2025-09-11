import 'package:flutter/material.dart';

class ActivitiesLogsListWidget extends StatelessWidget {
  const ActivitiesLogsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    final rows = <DataRow>[
      _row(context, 5, 'Darius Brakus', 'admin', 'logged in to the system', '14 minutes ago', '172.68.102.196', highlight: true),
      _row(context, 4, 'Shea Batz', 'customer', 'logged in to the customer portal', '18 minutes ago', '172.71.124.215'),
      _row(context, 3, 'Darius Brakus', 'admin', 'logged in to the system', '37 minutes ago', '172.71.82.146'),
      _row(context, 2, 'Darius Brakus', 'admin', 'logged in to the system', '39 minutes ago', '162.158.193.34'),
      _row(context, 1, 'Activity', '', 'has been deleted', '', ''),
    ];

    return DataTable(
      columnSpacing: 18,
      headingRowColor: MaterialStateProperty.all(isLight ? const Color(0xFFF5F7FA) : null),
      dividerThickness: 0,
      columns: const [
        DataColumn(label: SizedBox(width: 24)),
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('ACTION')),
        DataColumn(label: Text('OERATION')),
      ],
      rows: rows,
    );
  }

  DataRow _row(BuildContext context, int id, String user, String role, String action, String timeago, String ip, {bool highlight = false}) {
    final theme = Theme.of(context);
    return DataRow(cells: [
      const DataCell(Icon(Icons.radio_button_unchecked, size: 18)),
      DataCell(Text('$id')),
      DataCell(Row(children: [
        CircleAvatar(
            radius: 13,
            backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
            child: Icon(
              Icons.shopping_bag,
              color: theme.colorScheme.primary,
              size: 15,
            )),
        const SizedBox(width: 12),
        Flexible(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Wrap(crossAxisAlignment: WrapCrossAlignment.center, spacing: 8, children: [
              Text(user, style: theme.textTheme.labelSmall!.copyWith(color: Colors.blue)),
              if (role.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                  child: Text(role, style: theme.textTheme.displaySmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              Text(action, style: theme.textTheme.labelSmall),
            ]),
            const SizedBox(height: 4),
            if (timeago.isNotEmpty)
              Wrap(spacing: 8, children: [
                Text(timeago, style: theme.textTheme.displaySmall),
                if (ip.isNotEmpty) Text('($ip)', style: theme.textTheme.displaySmall!.copyWith(color: Colors.blue)),
              ]),
          ]),
        ),
      ])),
      DataCell(_deleteBtn(context)),
    ], color: highlight ? MaterialStateProperty.all(Colors.grey.withValues(alpha: 0.08)) : null);
  }

  Widget _deleteBtn(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6)),
      child: const Icon(Icons.delete, color: Colors.white, size: 18),
    );
  }
}
