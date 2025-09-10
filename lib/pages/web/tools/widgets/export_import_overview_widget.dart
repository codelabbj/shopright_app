import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExportImportOverviewWidget extends StatelessWidget {
  const ExportImportOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final exportTiles = <_Tile>[
      _Tile('Post Translations', 'Export translations for Post Translations to a CSV/Excel file.', Icons.translate, null),
      _Tile('Product Category Translations', 'Export translations to a CSV/Excel file.', Icons.translate, null),
      _Tile('Product Translations', 'Export translations for Product Translations to a CSV/Excel file.', Icons.translate, null),
      _Tile('Locations', 'Export your location data like countries, states, and cities.', Icons.place_outlined, () => context.go('/tools/export-locations')),
      _Tile('Products', 'Export your product data to CSV or Excel files.', Icons.inventory_2_outlined, null),
      _Tile('Product categories', 'Export product categories to Excel/CSV file.', Icons.category_outlined, null),
      _Tile('Customers', 'Export customers to Excel/CSV file.', Icons.people_outline, null),
      _Tile('Theme Translations', 'Export Theme Translations data to a CSV or Excel file.', Icons.translate, null),
      _Tile('Other Translations', 'Export Other Translations data to a CSV or Excel file.', Icons.translate, null),
      _Tile('Orders', 'Export orders to a CSV file', Icons.receipt_long_outlined, null),
      _Tile('Posts', 'Export posts to CSV/Excel file.', Icons.article_outlined, null),
    ];

    final importTiles = <_Tile>[
      _Tile('Locations', 'Import location data easily from available data or by uploading a CSV/Excel file.', Icons.place_outlined, () => context.go('/locations/importer')),
      _Tile('Products', 'Import your product data from CSV or Excel files.', Icons.inventory_2_outlined, null),
      _Tile('Post Translations', 'Import translations for Post Translations from a CSV/Excel file.', Icons.translate, null),
      _Tile('Product Category Translations', 'Import translations from a CSV/Excel file.', Icons.translate, null),
      _Tile('Product Translations', 'Import translations from a CSV/Excel file.', Icons.translate, null),
      _Tile('Product Prices', 'Update product prices in bulk by uploading a CSV/Excel file.', Icons.price_change_outlined, null),
      _Tile('Product Inventory', 'Update product inventory in bulk by uploading a CSV/Excel file.', Icons.inventory_outlined, null),
      _Tile('Product categories', 'Import product categories from Excel/CSV file.', Icons.category_outlined, null),
      _Tile('Theme Translations', 'Import Theme Translations data from a CSV or Excel file.', Icons.translate, null),
      _Tile('Other Translations', 'Import Other Translations data from a CSV or Excel file.', Icons.translate, null),
      _Tile('Customers', 'Import customers from Excel/CSV file.', Icons.people_outline, null),
      _Tile('Posts', 'Import posts from CSV/Excel file.', Icons.article_outlined, null),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _section(context, 'Export', exportTiles),
        const SizedBox(height: 16),
        _section(context, 'Import', importTiles),
      ],
    );
  }

  Widget _section(BuildContext context, String title, List<_Tile> tiles) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: Theme.of(context).brightness == Brightness.light
            ? [BoxShadow(color: Colors.grey.withValues(alpha: 0.1), blurRadius: 8, offset: Offset(0, 3))]
            : [],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Wrap(spacing: 12, runSpacing: 12, children: tiles.map((t) => _TileCard(t: t)).toList()),
      ]),
    );
  }

  // Widget _tile(BuildContext context, String title, String subtitle, {VoidCallback? onTap}) {
  //   final theme = Theme.of(context);
  //   return InkWell(
  //     onTap: onTap,
  //     child: Container(
  //       width: 360,
  //       padding: const EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //         color: theme.colorScheme.surface,
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(color: theme.dividerColor),
  //       ),
  //       child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //         Container(
  //           height: 36,
  //           width: 36,
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: theme.colorScheme.primary.withOpacity(0.1),
  //           ),
  //           alignment: Alignment.center,
  //           child: Icon(Icons.inventory_2_outlined, color: theme.colorScheme.primary),
  //         ),
  //         const SizedBox(width: 12),
  //         Expanded(
  //           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //             Text(title, style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
  //             const SizedBox(height: 6),
  //             Text(subtitle, style: theme.textTheme.displaySmall),
  //           ]),
  //         )
  //       ]),
  //     ),
  //   );
  // }
}

class _Tile {
  final String title;
  final String subtitle;
  final IconData icon;
  VoidCallback? onTap;
  _Tile(this.title, this.subtitle, this.icon, this.onTap);
}

class _TileCard extends StatelessWidget {
  final _Tile t;
  const _TileCard({required this.t});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      child: InkWell(
        onTap: t.onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: Row(children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(t.icon, size: 20, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(t.title, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(t.subtitle, style: Theme.of(context).textTheme.displaySmall),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
