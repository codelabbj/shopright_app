import 'package:flutter/material.dart';

import '../../../../models/browser_stat_model.dart';

class TopBrowsersWidget extends StatefulWidget {
  final List<BrowserStat> data;

  const TopBrowsersWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<TopBrowsersWidget> createState() => _TopBrowsersWidgetState();
}

class _TopBrowsersWidgetState extends State<TopBrowsersWidget> {
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
          ListTile(
            dense: true,
            title: Text("Top Browsers", style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
            trailing: DropdownButton<String>(
              value: selectedFilter,
              underline: const SizedBox(),
              items: filters.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) => setState(() => selectedFilter = value!),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isLight ? const Color(0xFFF5F7FA) : theme.colorScheme.surface,
              border: Border.all(color: theme.dividerColor),
            ),
            child: Row(children: [
              Expanded(flex: 1, child: Text('#', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
              Expanded(flex: 7, child: Text('Browser', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
              Expanded(flex: 4, child: Text('Sessions', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
            ]),
          ),
          ...List.generate(widget.data.length, (index) {
            final item = widget.data[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: theme.dividerColor, width: 0.6)),
              ),
              child: Row(children: [
                Expanded(flex: 1, child: Text('${index + 1}', style: theme.textTheme.labelSmall)),
                Expanded(flex: 7, child: Text(item.name, style: theme.textTheme.labelSmall)),
                Expanded(flex: 4, child: Text(item.sessions.toString(), style: theme.textTheme.labelSmall)),
              ]),
            );
          }),
        ],
      ),
    );
  }
}
