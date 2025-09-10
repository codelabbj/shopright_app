import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieOverviewWidget extends StatelessWidget {
  const PieOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.cardColor,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Orders by Status', style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          AspectRatio(
            aspectRatio: 1.4,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                sections: _sections(theme),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(spacing: 12, runSpacing: 8, children: [
            _legend(theme.colorScheme.primary, 'Completed'),
            _legend(Colors.orange, 'Processing'),
            _legend(Colors.redAccent, 'Cancelled'),
          ]),
        ]),
      ),
    );
  }

  List<PieChartSectionData> _sections(ThemeData theme) {
    return [
      PieChartSectionData(value: 60, color: theme.colorScheme.primary, title: '60% ', titleStyle: theme.textTheme.displaySmall),
      PieChartSectionData(value: 25, color: Colors.orange, title: '25% ', titleStyle: theme.textTheme.displaySmall),
      PieChartSectionData(value: 15, color: Colors.redAccent, title: '15% ', titleStyle: theme.textTheme.displaySmall),
    ];
  }

  Widget _legend(Color color, String label) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(width: 10, height: 10, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3))),
      const SizedBox(width: 6),
      Text(label),
    ]);
  }
}


