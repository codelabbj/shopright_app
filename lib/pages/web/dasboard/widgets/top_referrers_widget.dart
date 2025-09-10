import 'package:flutter/material.dart';

class TopReferrersWidget extends StatefulWidget {
  const TopReferrersWidget({super.key});

  @override
  State<TopReferrersWidget> createState() => _TopReferrersWidgetState();
}

class _TopReferrersWidgetState extends State<TopReferrersWidget> {
  String selectedFilter = 'Today';
  final List<String> filters = const ['Today', 'Yesterday', 'Last 7 Days', 'This Month'];

  final List<Map<String, dynamic>> rows = const [
    {'url': '(direct)', 'views': 1024},
    {'url': '(not set)', 'views': 729},
    {'url': 'google', 'views': 585},
    {'url': 'codecanyon.net', 'views': 327},
    {'url': 'turkhacks.com', 'views': 17},
    {'url': 'rental-system.devv', 'views': 12},
    {'url': 'localhost:8000', 'views': 10},
    {'url': 'mollie.com', 'views': 5},
    {'url': 'nefoi.com', 'views': 4},
    {'url': 'facebook.com', 'views': 2},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    return Card(
      color: theme.cardColor,
      margin: const EdgeInsets.all(16),
      child: Column(children: [
        ListTile(
          dense: true,
          title: Text('Top Referrers', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          trailing: DropdownButton<String>(
            value: selectedFilter,
            underline: const SizedBox(),
            items: filters.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (v) => setState(() => selectedFilter = v!),
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
            Expanded(flex: 7, child: Text('URL', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
            Expanded(flex: 4, child: Text('Views', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
          ]),
        ),
        ...List.generate(rows.length, (index) {
          final r = rows[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: theme.dividerColor, width: 0.6))),
            child: Row(children: [
              Expanded(flex: 1, child: Text('${index + 1}', style: theme.textTheme.labelSmall)),
              Expanded(flex: 7, child: Text(r['url'] as String, style: theme.textTheme.labelSmall)),
              Expanded(flex: 4, child: Text('${r['views']}', style: theme.textTheme.labelSmall)),
            ]),
          );
        })
      ]),
    );
  }
}


