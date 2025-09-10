import 'package:flutter/material.dart';

class EcommerceOverviewWidget extends StatelessWidget {
  const EcommerceOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.cardColor,
      margin: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Ecommerce', style: theme.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
        ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
          child: Row(children: [
            Icon(Icons.show_chart, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('\$0.00', style: theme.textTheme.labelLarge!.copyWith(color: Colors.blue, fontWeight: FontWeight.bold)),
                Text('Revenue this month', style: theme.textTheme.displaySmall, softWrap: true),
              ]),
            )
          ]),
        ),
        const Divider(height: 1),
        _pairOrColumn(
          context,
          _metric(context, Icons.local_shipping_outlined, Colors.green, '3', 'order(s) processing in this month'),
          _metric(context, Icons.local_shipping, Colors.grey, '0', 'order(s) completed in this month'),
        ),
        const Divider(height: 1),
        _pairOrColumn(
          context,
          _metric(context, Icons.error_outline, Colors.orange, '0', 'product(s) will be out of stock soon'),
          _metric(context, Icons.close, Colors.red, '0', 'product(s) out of stock'),
        ),
      ]),
    );
  }

  Widget _metric(BuildContext context, IconData icon, Color color, String value, String label) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: color),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(value, style: theme.textTheme.labelLarge!.copyWith(color: Colors.blue, fontWeight: FontWeight.bold)),
            Text(label, style: theme.textTheme.displaySmall, softWrap: true),
          ]),
        ),
      ]),
    );
  }

  Widget _pairOrColumn(BuildContext context, Widget left, Widget right) {
    final theme = Theme.of(context);
    return LayoutBuilder(builder: (ctx, constraints) {
      final narrow = constraints.maxWidth < 620;
      if (narrow) {
        return Column(children: [
          left,
          Divider(color: theme.dividerColor, height: 1),
          right,
        ]);
      }
      return IntrinsicHeight(
        child: Row(children: [
          Expanded(child: left),
          VerticalDivider(width: 1, thickness: 1, color: theme.dividerColor),
          Expanded(child: right),
        ]),
      );
    });
  }
}


