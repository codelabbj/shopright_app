import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExportLocationsWidget extends StatelessWidget {
  const ExportLocationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: Theme.of(context).brightness == Brightness.light
            ? [BoxShadow(color: Colors.grey.withValues(alpha: 0.1), blurRadius: 8, offset: const Offset(0, 3))]
            : [],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Export Locations', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 40),
        Center(
          child: Column(children: [
            Icon(Icons.sentiment_neutral_outlined, size: 64, color: Theme.of(context).iconTheme.color),
            const SizedBox(height: 16),
            Text('No data to export', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text('Looks like there is no data to export.', style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 16),
            SizedBox(
              height: 42,
              child: ElevatedButton.icon(
                onPressed: () => context.go('/tools/export-import'),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Export/Import Data'),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}


