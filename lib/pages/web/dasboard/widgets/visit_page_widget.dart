import 'package:flutter/material.dart';

import '../../../../models/visit_model.dart';

class TopVisitPagesWidget extends StatefulWidget {
  final List<VisitPageStat> data;

  const TopVisitPagesWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<TopVisitPagesWidget> createState() => _TopVisitPagesWidgetState();
}

class _TopVisitPagesWidgetState extends State<TopVisitPagesWidget> {
  String selectedFilter = "Today";

  final List<String> filters = ["Today", "Yesterday", "This Week", "Last 7 Days", "This Month", "Last 30 Days", "This Year"];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    return Card(
      color: theme.cardColor,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Header with title and filter
          ListTile(
            dense: true,
            title: Text("Top Most Visit Pages", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
            trailing: DropdownButton<String>(
              value: selectedFilter,
              underline: const SizedBox(),
              items: filters.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) => setState(() => selectedFilter = value!),
            ),
          ),
          // Column headers strip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isLight ? const Color(0xFFF5F7FA) : theme.colorScheme.surface,
              border: Border.all(color: theme.dividerColor),
            ),
            child: Row(children: [
              Expanded(flex: 1, child: Text('#', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
              Expanded(flex: 9, child: Text('URL', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
              Expanded(flex: 2, child: Text('Views', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
            ]),
          ),
          // Rows
          ...List.generate(widget.data.length, (index) {
            final stat = widget.data[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: theme.dividerColor, width: 0.6)),
              ),
              child: Row(children: [
                Expanded(flex: 1, child: Text('${index + 1}', style: theme.textTheme.labelSmall)),
                Expanded(
                  flex: 9,
                  child: Text(
                    stat.title,
                    style: theme.textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(flex: 2, child: Text((stat.views ?? 0).toString(), style: theme.textTheme.labelSmall)),
              ]),
            );
          }),
        ],
      ),
    );
  }
}
