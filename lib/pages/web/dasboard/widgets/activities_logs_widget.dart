import 'package:flutter/material.dart';

class ActivitiesLogsWidget extends StatelessWidget {
  const ActivitiesLogsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final logs = List.generate(10, (i) => {
          'name': 'Darius Brakus',
          'role': 'admin',
          'action': 'logged in to the system',
          'time': '${1 + i * 2} minutes ago',
          'ip': '172.71.124.${200 - i}',
        });
    return Card(
      color: theme.cardColor,
      margin: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Activities Logs', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
        ),
        const Divider(height: 1),
        ...logs.map((l) => _logRow(context, l)).toList(),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Text('Showing 1 to 10 of ${logs.length} records', style: theme.textTheme.displaySmall),
        ),
      ]),
    );
  }

  Widget _logRow(BuildContext context, Map<String, String> log) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: theme.colorScheme.primary.withOpacity(0.15), borderRadius: BorderRadius.circular(8)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Wrap(spacing: 6, crossAxisAlignment: WrapCrossAlignment.center, children: [
              Text(log['name']!, style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(4)),
                child: const Text('admin', style: TextStyle(color: Colors.white, fontSize: 10)),
              ),
              Text('logged in to the system', style: theme.textTheme.labelSmall),
            ]),
            const SizedBox(height: 4),
            Text('${log['time']} (${log['ip']})', style: theme.textTheme.displaySmall),
          ]),
        )
      ]),
    );
  }
}


